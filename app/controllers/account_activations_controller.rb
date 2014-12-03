class AccountActivationsController < ApplicationController
  
  def edit
    subscriber = Subscriber.find_by(email: params[:email])
    if subscriber && !subscriber.activated? && subscriber.authenticated?(params[:id])
       subscriber.activate
       flash[:notice] = "Subscribed Successfully!"
       # REDIRECT TO A STATIC PAGE WHICH SAYS "SUCCESSFUL"
    end
      flash[:error] = "Something went wrong ! Perhaps you already subscribed with this email id?"
      #change this to a another static page
      redirect_to subscribers_path
    
  end

end
