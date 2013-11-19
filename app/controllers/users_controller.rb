class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @users = User.find(params[:id])
  end

  def create
  	@user = User.create(params[:user].permit(:email, :password, :password_confirmation))
	  if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to action:"new"
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  def follow
    current_user.follow(params[:id])
    redirect_to users_path
  end

end
