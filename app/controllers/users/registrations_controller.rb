####app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController #creating a class and inhertiting devise class
  
  def create #adding to the devise "create" action so we can create more than jus user name, ect.
    super do |resource|
      if params[:plan] 
        resource.plan_id = params[:plan]  # storing in the database which plan the user choose. eg. User.first.plan_id = 2 ( PRO USER)
        if resource.plan_id == 2 # if plan_id is equal to 2, 
          resource.save_with_payment #then run method .save_with_payment
        else
          resource.save # else method .save  which saves reglarly for basic user
        end
      end
    end
  end
  
end

