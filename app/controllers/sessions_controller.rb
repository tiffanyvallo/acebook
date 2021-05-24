class SessionsController < ApplicationController
 
  skip_before_action :require_login, only: [:new, :create]

  def new
    render '/users/index'
  end
  
  def show
    if current_user.nil?
      redirect_to '/path/to/login'
    end
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to '/', notice: "Welcome, #{user.name}"
    else
      redirect_to '/login', notice: "Invalid email/password combination"
    end
  end


  def destroy
    p "INSIDE DESTROY METHOD"
    p "cookies- remeber token" 
    p cookies[:remember_token]
    p "current user"
    p current_user
    p "session"
    p session
    log_out
    session[:user_id] = nil
    redirect_to "/login", notice: "Logged out"
    p "INSIDE DESTROY METHOD AFTER LOGOUT METHOD AND REDIRECT"
    p "cookies rember token" 
    p cookies[:remember_token]
    p "current user" 
    p current_user
    p "session"
    p session
  end

  
end
