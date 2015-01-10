require 'rails_autolink'
class TempJobPostsController < ApplicationController
  
  def new
    set_company
    @temp_job_post = TempJobPost.new
  end

  def show
    @temp_job_post = TempJobPost.find_by(id: params[:id])
    @company = @temp_job_post.company
    cookies.permanent[:temp_job_id] = params[:id]
   end  

  def create

    @temp_job_post = TempJobPost.new(job_params)
    set_company

    @temp_job_post.company = @company
    if @temp_job_post.save 
      redirect_to jobpreview_path(@temp_job_post)
    else
      render :new
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
      render :edit
    end
    
  end

  private
  
  def job_params
    params.require(:temp_job_post).permit(:job_title,:job_desc,:category,:application_instructions)
  end
  
  def set_company
    @company = Company.find(company_params[:company_id])
  end
  
  def company_params
    params.permit(:company_id)
  end

end
