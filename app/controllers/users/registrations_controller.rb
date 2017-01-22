####app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController #creating a class and inhertiting devise class
  
  before_filter :select_plan, only: :new # select_plan is he name of filter ,that will only happen when user goes to sign up pages ( new ) 
  
  
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
  
  private
  def select_plan  # method select_plan ( FOR a case if user enters 3 or any otehr number in url brower line)
    unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2') # unless plan exist and plan is either 1 or 2 ,if not 
    flash[:notice] = "Please select a membership plan to sign up." # redirec to root page with this message
    redirect_to root_url # redirect to root page
    end
  end
end

