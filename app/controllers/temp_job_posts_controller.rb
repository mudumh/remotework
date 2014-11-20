require 'rails_autolink'
class TempJobPostsController < ApplicationController
  
  def new
    @temp_job_post = TempJobPost.new
    @company = Company.new
    render 'temp_job_posts/new'
  end

  def show
    @temp_job_post = TempJobPost.find_by(id: params[:id])
    @company = @temp_job_post.company
    
    cookies.permanent[:temp_job_id] = params[:id]
    
  end  

  def create

    @temp_job_post = TempJobPost.new(job_params)
    @company = Company.new(company_params)
    @temp_job_post.company = @company
    if @temp_job_post.save && @company.save
      redirect_to jobpreview_path(@temp_job_post)
    else
    end
  end
  
  def edit
     @temp_job_post = TempJobPost.find_by(id: params[:id])
     @company = @temp_job_post.company
  end
  
  def update
    
    @temp_job_post = TempJobPost.find_by(id: params[:id])
    @company = @temp_job_post.company
    if @temp_job_post.update_attributes(job_params) && @company.update_attributes(company_params)
      redirect_to jobpreview_path(@temp_job_post)
    else
    end
    
  end

  private
  
  def job_params
    params.require(:temp_job_post).permit(:job_title,:job_desc,:category,:application_instructions)
  end

  def company_params
    params.require(:company).permit(:name,:url,:email,:headquarters,:image)
  end

end
