class CreateProviderAttaches < ActiveRecord::Migration[5.1]
  def change
    create_table :provider_attaches do |t|
      t.string :image, null:false
      t.string :title, null:false
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
