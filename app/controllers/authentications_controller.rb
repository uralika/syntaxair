class AuthenticationsController < ApplicationController
    before_action :authenticate_user, only: [:destroy]

    def new
        # Are they already logged in?
        if current_user # They are! Can't create them again
            redirect_to root_url
        else
            @user = User.new
        end
    end

    def create
        if user = User.find_by(email: params[:user][:email]) 
            # authenticate user
            if user.authenticate(params[:user][:password]) && if session[:user_id] = user.id
                redirect_to root_url
            else 
                redirect_to users_new_url 
            end
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to users_new_url,
        notice: "You signed out."
    
    end

end

