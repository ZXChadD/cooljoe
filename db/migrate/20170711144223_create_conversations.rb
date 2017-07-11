class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :provider, foreign_key: true, null: false

      t.timestamps
    end
  end
end
