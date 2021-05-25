class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :set_theme
  before_action :require_login
  

  def handle_unverified_request
    log_out
    super
  end


  

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym

      cookies[:theme] = theme
      redirect_to(request.referrer || root_path)
    end
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "Please Login!"
        redirect_to login_url
      end
    end
end
