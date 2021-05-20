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
    params.require(:user).permit(:name, :dob, :email, :password_digest)
  end

  def check_db
    if User.exists?(email: params[:user][:email])
      true
    else
      false
    end
    # can refactor code to remove conditional (implicit return - keep only User.exists?(email: params[:user][:email]))
  
  end

  
  def notice

  end

  # def alert

  # end

end
