class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    if check_db
      redirect_to "/users/new", alert: "Error: This email is already in use"
      
    else
      @user = User.create(user_params)
      redirect_to "/", notice: "Success: New Account Created"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :dob, :email, :password)
  end

  def check_db
    if User.exists?(email: params[:user][:email])
      true
    else
      false
    end
    # use rails exist method to check if user already in database and prevent multiple account creation - raise flash error message,
  
  end

  
  def notice

  end

  # def alert

  # end

end
