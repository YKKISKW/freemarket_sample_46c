class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string, null:false
    add_column :users, :first_name_kana, :string, null:false
    add_column :users, :last_name_kana, :string, null:false
    add_column :users, :year, :integer, null:false
    add_column :users, :month, :integer, null:false
    add_column :users, :day, :integer, null:false
  end
end
