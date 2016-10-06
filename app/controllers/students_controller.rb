class StudentsController < ApplicationController
  def index
    @students = Student.where(team_id: nil)
  end

  def show
    @student = Student.find_by(id: params[:id].to_i)
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
    @student = Student.find(params[:id].to_i)

    render 'edit'
  end

  def destroy
    @student = Student.find(params[:id].to_i)
    @student.destroy

    redirect_to teachers_path
  end

  def update

    @student = Student.find_by(id: params[:id].to_i)
    if @student && @student.team == nil
      @student.update_attributes(team_id: params[:student][:team_id].to_i)
      @student.save
      @team = Team.find_by(id: params[:student][:team_id].to_i)
      redirect_to team_path(@team)
    else
      @student.update_attributes(team_id: nil)
      redirect_to student_path(@student)
    end
  end

  private

  def student_params
   params.require(:student).permit(:first_name, :last_name, :gender, :gpa, :number_of_detentions, :sports_teams, :number_of_absences)
  end

end
