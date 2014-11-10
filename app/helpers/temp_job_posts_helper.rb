module TempJobPostsHelper
  def current_job_post=(tempjob)
    cookies.permanent[:job_id] = tempjob.id
  end
end
