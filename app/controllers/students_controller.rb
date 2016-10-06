class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  def temp
  end

end
