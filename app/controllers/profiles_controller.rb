class ProfilesController < ApplicationController
  before_action :authenticate_user! # (runs b4 other codes run ) unless your a signed up user you cannot edit or create or change a page ,none of these codes run
  before_action :only_current_user # (runs b4 other codes run ) method is private section below to stop other users from editing others by changing id in url .
  def new
    # form where a user can fill out the OWN profile ,noone else should b able to  go to this user's new profile 
    @user = User.find( params[:user_id] ) # reach in Users database to dertermine who is logged in
    @profile = Profile.new #( linking profiel and user)#@user.build_profile # because we have ( the nested resource in #routes.rb) we van use "biuld.profile" on @user EVRY USER TO HAV THIER OWN PROFILE
  end
  
  def create #
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params) # pass in the values of teh form fields getting stored in profile and he binding it to the user attahed ( user.biuld_profile)
    if @profile.save
      flash[:success] = "Profile Updated!" # alert a message 
      redirect_to user_path( params[:user_id] ) # redirect page to the users actual page ,passing in the user ID to see which user
    else
      render action: :new # if the profile doesnt save properly
    end
  end
    
  
  


def edit
   @user = User.find( params[:user_id] ) # call the ID of user
   @profile = @user.profile # pulling up the info of the profil uder
  
end

def update
  @user = User.find( params[:user_id] ) # call the ID of user
  @profile = @user.profile # pulling up the info of the profil user
  if @profile.update_attributes(profile_params) # if profile is logge din ,update user parameters
    flash[:success] = "Profile Updated!" #flash a message 
    redirect_to user_path (params[:user_id]) #redirect to user page
  else  
    render action: :edit # else if fails send  teh user back to edit page
  end
end 

  private # whitelist form fields for protections in public browser
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
    
    # CANNOT EDIT ANOTHER USER PROFILE BY CAHNGING ID IN URL
    def only_current_user
      @user = User.find( params[:user_id] ) #get current user
      redirect_to(root_url) unless @user == current_user # if the user from url is NOT the same as current user logged in then will redirect to home page
    end     
end     