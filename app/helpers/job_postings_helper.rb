module JobPostingsHelper
  def jobpost(job_posting)
    "<span id='jobtitle'> #{job_posting.job_title} </span> <span id= 'companytitle'>at #{job_posting.company.name}</span>".html_safe
  end
  
  def date_posted(job_posting)
    job_posting[:created_at].strftime("%b %d")
  end

  

end
