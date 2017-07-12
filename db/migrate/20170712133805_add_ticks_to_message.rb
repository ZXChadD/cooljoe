class AddTicksToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :providerticks, :string, default: 'green'
    add_column :messages, :userticks, :string, default: 'green' 
  end
end
