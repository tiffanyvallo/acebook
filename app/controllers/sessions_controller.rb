class SessionsController < ApplicationController
  
  
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/posts"
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'index'
    end

  end

  def destroy
    log_out
    redirect_to "/", notice: "Logged out"
  end
end
