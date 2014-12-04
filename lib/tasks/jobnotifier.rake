namespace :jobnotifier do 
  desc "Send a mail every Friday with job updates"
  task send_job_notification: :environment do
    puts "Send out job notifications"
    subscribers = Subscriber.where(activated: true)
    puts "#{subscribers.size}"
    email_list = Array.new
    subscribers.each do |subscriber|
      email_list.push(subscriber[:email])
    end
    email_list.each do |email|
      puts "#{email}"
    end
    SubscriberMailer.jobs_notifier(email_list).deliver  
  end

  
end