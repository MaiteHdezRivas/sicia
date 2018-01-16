class ProposalRequeriment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :requeriment

  scope :by_proposal, lambda { |id| where(proposal_id: id) }
  scope :by_requeriment_kind, lambda { |kind| joins(:requeriments).where(kind: kind) }

  def self.by_proposal_and_kind_requeriment(proposal, kind)
    proposal_requeriments = []
    where(proposal_id: proposal.id).each do |pr|
      proposal_requeriments << pr if pr.requeriment.kind == kind
    end
    proposal_requeriments
  end

end