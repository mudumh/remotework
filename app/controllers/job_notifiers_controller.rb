class JobNotifiersController < ApplicationController
  include JobNotifiersHelper
  def new
   
  end
  
  def create
    @email_list = active_email_list
    SubscriberMailer.jobs_notifier(@email_list).deliver
    redirect_to subscribers_path
  end
  def send

  end
end

