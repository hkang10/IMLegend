class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to teachers_path
  end

  def temp
  end

end
