class JobNotifiersController < ApplicationController
  def new
   
  end
  
  def create
    @subscribers = Subscriber.where(activated: true)
    @email_list = Array.new
    @subscribers.each do |subscriber|
      @email_list.push(subscriber[:email])
    end
    SubscriberMailer.jobs_notifier(@email_list).deliver
    redirect_to subscribers_path
  end
end

