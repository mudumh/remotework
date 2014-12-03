# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/account_activation
  def account_activation
    SubscriberMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/jobs_notifier
  def jobs_notifier
    SubscriberMailer.jobs_notifier
  end

end
