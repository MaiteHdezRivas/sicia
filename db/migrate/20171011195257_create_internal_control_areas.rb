class CreateInternalControlAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_control_areas do |t|
      t.string :trading_year, index: true
      t.string :code, index: true
      t.string :description

      t.string :updated_by
      t.timestamps
      t.timestamps
    end
  end
end
