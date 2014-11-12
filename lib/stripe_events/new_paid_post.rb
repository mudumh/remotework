class NewPaidPost
  
  def call(event)
    
    temp_job_id = event["data"]["object"]["metadata"]["job_id"]
    @temp_job = TempJobPost.find_by(id: temp_job_id)
    attributes = @temp_job.attributes.except!("id")
    JobPosting.create(attributes)
  end

end