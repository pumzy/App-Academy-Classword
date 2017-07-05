class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?, :log_in_user!, :require_login

  def current_user
    user = User.find_by(session_token: session[:session_token])
    if user
      return user
    else
      return nil
    end
  end

  def logged_in?
    current_user.nil? == false
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end


  def require_login

    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url
    end
  end

end
