class ChangeColumnTypeUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_year, :date
    change_column :users, :birth_month, :date
    change_column :users, :birth_day, :date
  end
end
