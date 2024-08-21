class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_info_user_path(@user)
  end

  def account_info
    @user = User.find(params[:id])
  end

  def profile_info
    @user = User.find(params[:id])
  end  

  private
   def user_params
    params.require(:user).permit(:profile_image, :username, :profile)
   end
end
