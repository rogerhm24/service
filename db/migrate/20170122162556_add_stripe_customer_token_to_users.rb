####db/migrate/xyz_add_stripe_customer_token_to_users.rb
class AddStripeCustomerTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_token, :string # adding a column in users database ,thats named stripe_custmer_token ( customer id sent to us by stripe ). as a string
  end
end