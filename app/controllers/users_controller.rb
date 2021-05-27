class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
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
    # show
  
    if current_user.authenticate(user_params[:password])
      current_user.update(user_params)
      log_in current_user
        flash[:success] = "Profile updated"
        
        redirect_to "/users/#{current_user.id}"
    else 
      redirect_to "/users/#{current_user.id}/edit"
    end
    
  end

  def user_posts
    @posts = current_user.posts.order(created_at: :desc)
  end
  

  private
  
    def user_params
      params.require(:user).permit(:name, 
                                    :dob, 
                                    :email, 
                                    :bio, 
                                    :password, 
                                    :password_confirmation, 
                                    :avatar)
    end

end
