class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer   :item_id, foreign_key: true, null: false
      t.integer   :user_id, foreign_key: true, null: false
      t.string    :order_status, null: false
      t.timestamps
    end
  end
end
