class ChangeJoblistingColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :joblistings, :type, :issue
  end
end
