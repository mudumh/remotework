class CreateTempJobPosts < ActiveRecord::Migration
  def change
    create_table :temp_job_posts do |t|
      t.string :job_title
      t.date :posted_on
      t.text :job_desc
      t.string :category
      t.text :application_instructions

      t.timestamps null: false
    end
  end
end
