class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    
    @currentjob = JobPosting.current_posting
    id =  @currentjob.id
    title = @currentjob.job_title
    
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken],
      :metadata => {"job_id" => id}
    )
    

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    customer_meta_id = customer["metadata"]["job_id"]
    logger.info "CUSTOMER : #{customer_meta_id}"

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end


end
