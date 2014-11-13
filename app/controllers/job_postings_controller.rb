class JobPostingsController < ApplicationController

  def index
    if params[:query]
      @job_postings = JobPosting.text_search(params[:query]).paginate(:page => params[:page], :per_page => 10)
    else
      @job_postings = JobPosting.paginate(:page => params[:page], :per_page => 10)
    end 
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def new
    @job_posting = JobPosting.new
    @company = Company.new
  end

  def showpreview
    @job_posting = JobPosting.find(params[:id])

    render 'job_postings/showpreview'
    

  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    @company = Company.new(company_params)
    @job_posting.posted_on = Date.today    
    @job_posting.company = @company
  
    if @job_posting.save && @company.save
       redirect_to jobpreview_path(@job_posting)
    else
      
    end      

  end

  def edit
    @job_posting = JobPosting.find_by(id: params[:id])
    @company = @job_posting.company
  end

  def update

    @job_posting = JobPosting.find_by(id: params[:id])
    @job_posting.update_attributes(job_posting_params)
    @job_posting.company.update_attributes(company_params)
    redirect_to jobpreview_path(@job_posting)
  end

  def payment
    render 'payments/payment'
  end


  private

  def job_posting_params
    params.require(:job_posting).permit(:job_title,:job_desc,:category,:application_instructions,:company)
  end

  def company_params
    params.require(:company).permit(:name,:url,:email,:headquarters)
  end


end
