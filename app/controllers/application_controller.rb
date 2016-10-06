class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all

  def confirm_login
    if logged_in?
      yield
    else
      redirect_to '/'
    end
  end
end
