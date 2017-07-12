class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.references :provider, foreign_key: true, null: false
      t.text :body
      
      t.timestamps
    end
  end
end
