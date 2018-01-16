class ChangeRevisedCheckToBeIntegerInProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    change_column :proposal_requeriments, :revised_check, 'integer USING CAST(revised_check AS integer)'
  end
end
