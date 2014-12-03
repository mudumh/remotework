require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "account_activation" do
    mail = SubscriberMailer.account_activation
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "jobs_notifier" do
    mail = SubscriberMailer.jobs_notifier
    assert_equal "Jobs notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
