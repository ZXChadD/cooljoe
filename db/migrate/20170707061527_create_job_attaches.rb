class CreateJobAttaches < ActiveRecord::Migration[5.1]
  def change
    create_table :job_attaches do |t|
      t.string :image, null:false
      t.string :title, null:false
      t.references :joblisting, foreign_key: true

      t.timestamps
    end
  end
end
