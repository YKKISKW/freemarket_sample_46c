class AddcolumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :birth_day, :integer,null:false
  end

  def down
    remove_column :users, :birth_day, :integer,null:false
  end
end
