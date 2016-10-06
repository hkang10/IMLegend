class StudentsController < ApplicationController
  def index
    @students = Student.where(team_id: nil)
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to teachers_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    @team = @student.team_id
    @student.update_attributes(team_id: nil)

    redirect_to team_path(@team)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to teachers_path
  end

  def update
    student = Student.find_by(id: params[:student][:id])
    if student.team == nil
      student.update_attributes(team_id: params[:id])
      student.save
    end
    redirect_to team_route(params[:id])
  end

  private

  def student_params
   params.require(:student).permit(:first_name, :last_name, :gender, :gpa, :number_of_detentions, :sports_teams, :number_of_absences)
  end

end
