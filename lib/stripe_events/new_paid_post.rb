class NewPaidPost
  
  def call
    logger.info "NEW PAID POST"
    temp_job_id = cookies[:temp_job_id]
    logger.info "The cookie value is #{temp_job_id}"
    @temp_job = TempJobPost.find_by(id: temp_job_id)
    attributes = @temp_job.attributes.except!("id")
    JobPosting.create(attributes)
  end

end