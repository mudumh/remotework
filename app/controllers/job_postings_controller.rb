class JobPostingsController < ApplicationController
  def index
    @job_postings = JobPosting.all
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def new
    @job_posting = JobPosting.new
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    @job_posting.posted_on = Date.today
    if @job_posting.save
      redirect_to root_path
    else
    
    end      

  end

  private

  def job_posting_params
    params.require(:job_posting).permit(:job_title,:job_desc,:category,:application_instructions)
  end


end
