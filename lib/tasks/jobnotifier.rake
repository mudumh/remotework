namespace :jobnotifier do 
  desc "Send a mail every Friday with job updates"
  task send_job_notification: :environment do
    if Time.now.friday?
      subscribers = Subscriber.where(activated: true)
      email_list = Array.new
      subscribers.each do |subscriber|
        email_list.push(subscriber[:email])
      end
      SubscriberMailer.jobs_notifier(email_list).deliver  
    end
  end

end