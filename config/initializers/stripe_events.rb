# Do I need this ?
#Stripe.api_key = ENV['STRIPE_API_KEY'] # Set your api key
StripeEvent.configure do |events|
  
  events.subscribe 'charge.succeeded', NewPaidPost.new
end