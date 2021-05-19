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

  def check_db
    # if User.exists?(email: params[:user][:email]) == false
    #   redirect_to "/", notice: "Success: New account created"
    # else
    #   notice: "Error: This email is already in use"
    # use rails exist method to check if user already in database and prevent multiple account creation - raise flash error message,
    # end
  end

  
  def notice

  end

  # def alert

  # end

end
