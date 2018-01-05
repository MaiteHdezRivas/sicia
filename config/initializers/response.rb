module Savon
  module Multipart
    class Response
      def xml
        if multipart?
          parse_body unless @has_parsed_body
          @parts.first.body.to_s
          if xop?
            parse_xop unless @has_parsed_xop
            @xop_body
          else
            @parts.first.body.to_s
          end
        else
          super
        end
      end

      private

      def xop?
        if multipart?
          parse_body unless @has_parsed_body
          !(@parts.first.header['content-type'].to_s =~ /^application\/xop\+xml/i).nil?
        else
          false
        end
      end

      def parse_xop
        xml = @parts.first.body.to_s
        parsed = Nokogiri.XML(xml)
        xop_elements = parsed.xpath('//xop:Include', xop: "http://www.w3.org/2004/08/xop/include")
        if xop_elements.count == 0
          @xop_body = @parts.first.body.to_s
          @has_parsed_xop = true
          return
        end
        xop_elements.each do |xop_element|
          href = xop_element.attributes['href'].to_s
          cid = href[4..-1]
          data = @parts.find { |p| p.header['content-id'].to_s == "<#{cid}>" }.body.to_s
          xop_element.parent.content = Base64.encode64(data).chomp
        end
        @xop_body = parsed.to_s
        @has_parsed_xop = true
      end
    end
  end
end
