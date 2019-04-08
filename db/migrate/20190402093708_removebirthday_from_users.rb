class RemovebirthdayFromUsers < ActiveRecord::Migration[5.2]

  def up
    remove_column :users, :birthday
  end

  def down
    add_column :users, :birthday, :string
  end

end
