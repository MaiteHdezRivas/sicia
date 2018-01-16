module ApplicationHelper

  def proposal_read_view
    (action_name == 'show' || action_name == 'mark_requeriment')
  end


  def proposal_requeriments(proposal, kind)
    ProposalRequeriment.by_proposal_and_kind_requeriment(proposal, kind)
  end

  def show_simple_date(date, options = {})
    return unless date

    format =  case date
                when Date
                  '%d/%m/%Y'
                when DateTime, ActiveSupport::TimeWithZone
                  '%d/%m/%Y %H:%M'
                else
                  '%d/%m/%Y'
              end
    l(date, { format: format }.merge(options)) if format
  end


  def show_requeriment_check(req_check)
    case req_check
      when nil
        I18n.t("proposal_requeriment.verification.pending" )
      when 0
        I18n.t("proposal_requeriment.verification.false" )
      when 1
        I18n.t("proposal_requeriment.verification.true" )
      when 2
        I18n.t("proposal_requeriment.verification.no_apply" )
    end
  end

  def format_proposal_field(proposal, field)
    case field
      when :sicia_number
        proposal.formatted_sicia_number
      # index without id
      when :society_id, :manager_body_id, :approval_body_id, :society, :manager_body, :approval_body
       field = field.to_s.gsub("_id", "").to_sym
       proposal.send(field).code_and_description
      else
       proposal.send(field)
    end
  end  
  
end

