module SubscribersHelper
  def jobpostcompany(job_posting)
    "<span id= 'companytitle'> at #{job_posting.company.name}</span> ".html_safe
  end
   def jobpost(job_posting)
    "<span id='jobtitle'> #{job_posting.job_title} </span> &nbsp;".html_safe
  end
  

end
