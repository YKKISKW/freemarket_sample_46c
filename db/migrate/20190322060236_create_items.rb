class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.text        :description, null: false
      t.integer     :category_id, foreign_key: true, null: false
      t.integer     :brand_id,foreign_key: true, null: false
      t.integer     :status_id,foreign_key: true, null: false
      t.integer     :delivery_fee_id, foreign_key: true,null: false
      t.integer     :delivery_date_id,foreign_key: true, null: false
      t.integer     :price, foreign_key: true,null: false
      t.string      :avatar
      t.integer     :user_id, foreign_key: true,null: false
      t.integer     :size_id, foreign_key: true,null: false
      t.timestamps
    end
  end
end
