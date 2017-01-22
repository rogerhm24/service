class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile
  end
end



# class ProfilesController < ApplicationController

#     def new
#       # form where a user can fill out the OWN profile ,noone else should b able to  go to this user's new profile  
#       @user = User.find( params[:user_id]) # reach in Users database to dertermine who is logged in
#       @profile = @user.build_profile # because we have ( the nested resource in #routes.rb) we van use "biuld.profile" on @user EVRY USER TO HAV THIER OWN PROFILE
#     end    

# end    