class StudentsController < ApplicationController
  def index
    @students = Student.where(team_id: nil)
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

  def update
    student = Student.find_by(id: params[:student][:id])
    if student.team == nil
      student.update_attributes(team_id: params[:id])
      student.save
    end
    redirect_to team_route(params[:id])
  end

end
