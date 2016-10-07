class AdminsController < ApplicationController
  protect_from_forgery with: :exception
  def students
    confirm_login{
      @students = Student.all
    }
  end

  def control_panel
    confirm_login{
      render :control_panel
    }
  end
end
