# BASIC & PREMIUM PLANS

class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name # plan name eg BASIC
      t.decimal :price # PRICE of plan
      
      t.timestamps # Keeps strack of when plan was created or updated
      
    end
  end
end
