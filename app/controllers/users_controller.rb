class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # Nav bar will need user profile link in this html
  end

  def new
    @user = User.new
    @errors = flash[:errors]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success: New Account Created"
      redirect_to "login"
    else
      render 'new'
    end

  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :dob, :email, :password, :password_confirmation)
    end

end
