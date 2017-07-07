class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :firstname, null:false
      t.string :lastname, null:false
      t.string :tel_num, null:false
      t.string :license_num
      t.text :description
      t.string :experience
      t.string :avatar

      t.timestamps
    end
  end
end
