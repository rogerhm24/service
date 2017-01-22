
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan #every user belongs to (one) plan
  has_one :profile #evry user has one profile
  attr_accessor :stripe_card_token # use the hidden field to frome user.js file from teh token generated from stipe (series of letter an numbers ,instead of credit card)
  
  def save_with_payment
    if valid? # if form is filled out properly
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)# STripe code that create a customer,saved by email,not name save wehether (basic or pro) and save credit info  
      self.stripe_customer_token = customer.id # then stripe send us back an ID for this customer,setiing a variable also
      save! # save that user
    end
  end
end
