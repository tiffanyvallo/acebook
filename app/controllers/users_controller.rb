class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to "/", notice: "Success: New Account Created"
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :dob, :email, :password)
  end
end
