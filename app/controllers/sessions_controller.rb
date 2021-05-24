class SessionsController < ApplicationController
  
  
  def new

  end

  def show
    if @user logged_in? == false, redirect to 'users#login'
      (set get route for /login, 'users#login' --> currently commented out in
      routes.rb)
    else
      render 'root'
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
    log_in @user
    redirect_to '/', notice: "Welcome, #{user.name}"
    else
      redirect_to '/login', notice: "Invalid email/password combination"
    end
  end

  def destroy
    log_out
    redirect_to "/login", notice: "Logged out"
  end
end
