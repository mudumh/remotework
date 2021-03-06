class SubscriberMailer < ActionMailer::Base
  default from: "notifier@remoteprogrammerjobs.com"
  add_template_helper(JobPostingsHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.account_activation.subject
  #
  def account_activation(subscriber)
    @greeting = "Hi"
    @subscriber = subscriber

    mail to: subscriber.email, subject: "Confirm subscription"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.jobs_notifier.subject
  #
  def jobs_notifier(email_list)
    @listed_jobs = JobPosting.where(created_at: (Time.now.midnight-5.days)..(Time.now))
    @greeting = "Hi"
    headers['X-SMTPAPI'] = { :to => email_list.to_a }.to_json
    mail(
    :to => "info@ourcompany.com",
    :subject => "New Job Posted!"
    )
    
  end

end
