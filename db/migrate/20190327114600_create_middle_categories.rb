class CreateMiddleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :middle_categories do |t|
      t.string      :name, null: false
      t.references  :category, foreign_key: true
      t.timestamps
    end
  end
end
