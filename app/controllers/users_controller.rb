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
  	@users = User.create(params[:user].permit(:email, :password, :password_confirmation))
  	# redirect_to :action => "new"
    redirect_to images_url
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

end