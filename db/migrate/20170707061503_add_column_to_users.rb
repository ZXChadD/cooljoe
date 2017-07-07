class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string, null:false
    add_column :users, :lastname, :string
    add_column :users, :tel_num, :string
    add_column :users, :user_address, :text
    add_column :users, :is_admin, :boolean, null:false, default: false
  end
end
