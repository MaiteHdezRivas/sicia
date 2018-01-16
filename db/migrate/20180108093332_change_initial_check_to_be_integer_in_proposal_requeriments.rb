class ChangeInitialCheckToBeIntegerInProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    change_column :proposal_requeriments, :initial_check, 'integer USING CAST(initial_check AS integer)'
  end
end
