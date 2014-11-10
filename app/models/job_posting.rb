class JobPosting < ActiveRecord::Base
  belongs_to :company
  
  def self.current_posting=(job_posting)
    @job_posting = job_posting
  end

  def self.current_posting
    @job_posting
  end
  
 

end
