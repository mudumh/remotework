class AddCompanyToJobPostings < ActiveRecord::Migration
  def change
    add_reference :job_postings, :company, index: true
  end
end
