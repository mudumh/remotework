class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    
    @amount = 100
    temp_job_id = cookies[:temp_job_id]
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
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
    if charge
      puts "charge succedded"
      @temp_job = TempJobPost.find_by(id: temp_job_id)
      attributes = @temp_job.attributes.except!("id")
      JobPosting.create(attributes)
      
    end
    
    # need to test this
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
    
    rescue => e
    # Some other error; display an error message.
    flash[:notice] = 'Some error occurred.'
    end


end
