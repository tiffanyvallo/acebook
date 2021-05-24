class SessionsController < ApplicationController
  
  
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to '/posts', notice: "Welcome, #{user.name}"
    else
      redirect_to '/', notice: "Invalid email/password combination"
    end
  end

  def destroy
    log_out
    redirect_to "/", notice: "Logged out"
  end
end
