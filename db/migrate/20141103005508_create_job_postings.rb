class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :job_title
      t.date :posted_on
      t.text :job_desc
      t.string :category
      t.text :application_instructions

      t.timestamps null: false
    end
  end
end
