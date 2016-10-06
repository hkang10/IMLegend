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
    student = Student.find_by(id: params[:id].to_i)
    team_id = params[:student][:team_id].to_i
    @team = Team.find_by(id: team_id)

    case params[:student][:options]
    when 'add_to_team'
      if student && student.team == nil
        if @team.students.count < Team.max_students
          student.update_attributes(team_id: team_id)
          student.save
        else
          @errors = ["You have the maximum number of students (#{Team.max_students})"]
        end
      end
    when 'update_data'
    end
    redirect_to team_path(@team)
  end

  private

  def student_params
   params.require(:student).permit(:first_name, :last_name, :gender, :gpa, :number_of_detentions, :sports_teams, :number_of_absences)
  end

end
