class UsersController < ApplicationController

  def new
    @user = User.new
    @errors = flash[:errors]
  end

  def create
   @user = User.create(user_params)
    if @user.errors.present?
      flash[:errors] = "Error: This email is already in use"
      redirect_to "/users/new"
    else
      session[:user_id]=@user.id
      flash[:notice] = "Success: New Account Created"
      redirect_to "/"
    end

  end

  private
  
  def user_params
    params.require(:user).permit(:name, :dob, :email, :password, :password_confirmation)
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
