class SubscribersController < ApplicationController
  def new

  end
  
  
  def index
    @subscribers = Subscriber.where(activated: true)
    
  end
  
  def create
    @subscriber = Subscriber.new(params_subscriber)
    if @subscriber.valid?
      @subscriber.subscribe
      flash[:notice] = 'Please check your mail to confirm subscription'
    else 
      flash[:notice] = "Please enter a valid email"
    end
    redirect_to job_postings_path
    
  end

  def show
    
  end
 
  private
  
  def params_subscriber
    params.require(:subscriber).permit(:email)  
  end

end
