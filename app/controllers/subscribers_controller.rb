class SubscribersController < ApplicationController
  def new

  end
  
  
  def index
    @subscribers = Subscriber.where(activated: true)
    
  end
  
  def create
    @subscriber = Subscriber.new(params_subscriber)
    @subscriber.save
    SubscriberMailer.account_activation(@subscriber).deliver
    #set a flash message here and re-render the job postings index page.
    flash[:notice] = 'Please check your mail to confirm subscription'
    redirect_to job_postings_path 
  end

  def show
    
  end
 
  private
  
  def params_subscriber
    params.require(:subscriber).permit(:email)  
  end

end
