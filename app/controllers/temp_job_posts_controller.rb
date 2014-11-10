class TempJobPostsController < ApplicationController
  
  def new
    render 'temp_job_posts/new'
  end

  def create
    @temp_job_post = job_params
    @company = company_params

    render 'temp_job_posts/show'
  end

  private
  
  def job_params
    params.require(:temp_job_post).permit(:job_title,:job_desc,:category,:application_instructions)
  end

  def company_params
    params.require(:company).permit(:name,:url,:email,:headquarters)
  end

end
