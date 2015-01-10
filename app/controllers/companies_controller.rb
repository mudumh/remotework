class CompaniesController < ApplicationController
  respond_to :html, :json  
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
     @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find_by(id: params[:id])
    @company.update_attributes(company_params)
    respond_with @company
  end

  private

  def company_params
    params.require(:company).permit(:name,:url,:headquarters,:image)
  end

end
