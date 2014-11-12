class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    
    @amount = 10
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
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end


end
