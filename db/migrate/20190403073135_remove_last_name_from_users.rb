class RemoveLastNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :year, :integer
    remove_column :users, :month, :integer
    remove_column :users, :day, :integer
  end
end
