module SessionsHelper
  def log_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    p "COOKIES REACH LOG OUT METHOD"
    p cookies[:remember_token]
    p current_user
    cookies.delete(:remember_token)
    @current_user = nil
    p "COOKIES REACH LOG OUT METHOD AFTER DELETE AND RESET SESSION"
    p cookies[:remember_token]
    p current_user
  end

end
