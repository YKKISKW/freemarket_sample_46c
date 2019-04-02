class AddColumnForItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items,:item_status,:integer,null:false,default: 0
  end
end
