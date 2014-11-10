class AddCompanyToTempJobPosts < ActiveRecord::Migration
  def change
    add_reference :temp_job_posts, :company, index: true
  end
end
