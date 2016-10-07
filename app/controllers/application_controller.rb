class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all
  include TeacherHelper

  def confirm_login
    if logged_in?
      yield
    else
      @errors = ['Please login to continue']
      render :'/sessions/new'
    end
  end
end
