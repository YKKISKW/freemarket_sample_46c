class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :item, foreign_key: true, null: false, index: false
      t.references :user, foreign_key: true, null: false, index: false
      t.timestamps
    end
    add_index :likes, [:item_id, :user_id], unique: true
  end
end
