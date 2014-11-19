class ChargesController < ApplicationController

  def new
  
  end

  def create
    # Amount in cents
    
    @amount = 100
    temp_job_id = cookies[:temp_job_id]
    customer_email =  TempJobPost.find_by(id: temp_job_id).company[:email]
    
    customer = Stripe::Customer.create(
      :email => customer_email,
      :card  => params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :metadata => {"job_id"=> temp_job_id}
    )
    # TODO: charge.paid or charge["paid"]
    if charge["paid"] == true
      @temp_job = TempJobPost.find_by(id: temp_job_id)
      attributes = @temp_job.attributes.except!("id")
      JobPosting.create(attributes)   
    end
    
    # need to test this and refactor this using begin-->rescue--->end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    
  end
end
