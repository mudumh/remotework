class AddActivatedToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :activated, :boolean, default: false
  end
end
