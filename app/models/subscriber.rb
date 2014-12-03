class Subscriber < ActiveRecord::Base
  attr_accessor :activation_token
  before_create :create_activation_digest
  def digest
  end
  
  def token
  end

  def Subscriber.new_token
    SecureRandom.urlsafe_base64
  end

  def Subscriber.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

   def create_activation_digest
      self.activation_token  = Subscriber.new_token
      
      self.activation_digest = Subscriber.digest(activation_token)
  end

  def authenticated?(activation_token)
  return false if activation_digest.nil?
  BCrypt::Password.new(activation_digest).is_password?(activation_token)
  end

  def activate
    update_attribute(:activated,true)
  end



end
