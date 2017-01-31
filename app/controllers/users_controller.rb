class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id]) # get  id from User database but is id not user_id because of route path /users/:id for the users#show   page ( see users route.rb)
    end
end    