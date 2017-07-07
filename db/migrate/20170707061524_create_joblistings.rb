class CreateJoblistings < ActiveRecord::Migration[5.1]
  def change
    create_table :joblistings do |t|
      t.string :type, null:false
      t.text :description, null:false
      t.string :fixture, null:false
      t.integer :num_fixture, null:false
      t.string :housing, null:false
      t.text :job_address, null:false
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true
      t.integer :status, null:false, default: 1
      t.string :date, null:false
      t.string :time, null:false

      t.timestamps
    end
  end
end
