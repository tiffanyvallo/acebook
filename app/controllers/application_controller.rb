class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def handle_unverified_request
    log_out
    super
  end


  before_action :set_theme

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym

      cookies[:theme] = theme
      redirect_to(request.referrer || root_path)
    end
  end
end
