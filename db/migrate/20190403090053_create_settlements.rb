class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements do |t|
      t.references :order, null: false , foreign_key: true
      t.string :charge_id, null: false
      t.timestamps
    end
  end
end
