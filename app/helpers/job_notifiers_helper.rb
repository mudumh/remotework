module JobNotifiersHelper
  def active_email_list
    @subscribers = Subscriber.where(activated: true)
    @email_list = Array.new
    @subscribers.each do |subscriber|
      @email_list.push(subscriber[:email])
    end
    @email_list
  end
  
 
end
