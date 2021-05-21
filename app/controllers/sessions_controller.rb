class SessionsController < ApplicationController
  
  
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to '/posts' ### ROUTE IS NOT WORKING
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render '/'
    end
    
    #   log_in user
    #   redirect_to "/posts"
    # else
    #  
    #   render 'index'
    # end

  end

  def destroy
    log_out
    redirect_to "/", notice: "Logged out"
  end
end
