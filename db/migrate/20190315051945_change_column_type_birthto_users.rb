class ChangeColumnTypeBirthtoUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birth_day
    remove_column :users, :birth_month
    rename_column :users, :birth_year, :birthday
  end
end
