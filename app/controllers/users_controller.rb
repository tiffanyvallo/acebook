class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
      redirect_to "/login"
    else
      render 'new'
    end
  end

  def update
    show
    if current_user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to current_user
    else
      render 'edit'
    end
    # current_user.update(user_params)
    # redirect_to current_user
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :dob, :email, :password, :password_confirmation, :avatar)
    end

end
