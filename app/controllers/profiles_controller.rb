class ProfilesController < ApplicationController
  def new
    # form where a user can fill out the OWN profile ,noone else should b able to  go to this user's new profile 
    @user = User.find( params[:user_id] ) # reach in Users database to dertermine who is logged in
    @profile = @user.build_profile # because we have ( the nested resource in #routes.rb) we van use "biuld.profile" on @user EVRY USER TO HAV THIER OWN PROFILE
  end
  
  def create #
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params) # pass in the values of teh form fields getting stored in profile and he binding it to the user attahed ( user.biuld_profile)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
    
    private # whitelist form fields for protections in public browser
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
  
end



