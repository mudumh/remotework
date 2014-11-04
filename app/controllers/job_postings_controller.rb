class JobPostingsController < ApplicationController
  def index
    @job_postings = JobPosting.all
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def new
    @job_posting = JobPosting.new
    @company = Company.new
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    @company = Company.new(company_params)
    debugger
    @job_posting.posted_on = Date.today    
    @job_posting.company = @company
    
    if @job_posting.save && @company.save
        redirect_to root_path
    else
      
    end      

  end

  private

  def job_posting_params
    params.require(:job_posting).permit(:job_title,:job_desc,:category,:application_instructions)
  end

  def company_params
    params.require(:company).permit(:name,:url,:email,:headquarters)
  end


end
