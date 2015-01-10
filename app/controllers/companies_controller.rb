class CompaniesController < ApplicationController
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to new_company_temp_job_post_path(@company.id)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end

  private

  def company_params
    params.require(:company).permit(:name,:url,:headquarters,:image)
  end
end
