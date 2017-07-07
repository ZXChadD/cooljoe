class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :date, null:false
      t.string :time, null:false
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
