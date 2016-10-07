class StudentsController < ApplicationController
include AdminsHelper
  def index
    confirm_login {
      @students = Student.where(team_id: nil)
    }
  end

  def show
    confirm_login{
      @student = Student.find_by(id: params[:id].to_i)
    }
  end

  def new
    confirm_login{
      @student = Student.new
    }
  end

  def create
    confirm_login{
      @student = Student.new(student_params)
      @student.add_sports(params[:student][:sports_teams])

      if @student.save
        redirect_to teachers_path
      else
        render :new
      end
    }
  end

  def edit
    confirm_login{
      @student = Student.find(params[:id].to_i)
      render 'edit'
    }
  end

  def destroy
    confirm_login{
      @student = Student.find(params[:id].to_i)
      if @student.captained_team
        @student.captained_team.captain = nil
      end
      @student.destroy

      redirect_to teachers_path
    }
  end

  def update
    confirm_login{
      @student = Student.find_by(id: params[:id].to_i)
      team_id = params[:student][:team_id].to_i
      @team = Team.find_by(id: team_id)

      case params[:student][:options]
      when 'add_to_team'
        if @student && @student.team == nil && current_teacher.team.id == team_id
          if @team.students.count < Team.max_students
            @student.update_attributes(team_id: team_id)
            @student.save
            redirect_to team_path(@team)
          else
            @errors = ["You have the maximum number of students (#{Team.max_students})"]
            respond_to do |format|
              format.html { render :show}
              format.js {}
            end
          end
        end
      when 'update_data'
        if params[:student][:sports_teams] != nil
          @student.add_sports(params[:student][:sports_teams][0])
        end
        @student.update_attributes(student_params)
        if !@student.save
          @errors = @student.errors.full_messages
          @student = Student.find(@student.id)
            respond_to do |format|
              format.html { render :edit }
              format.js {}
            end
        else
          redirect_to student_path(@student)
        end
      when 'remove_from_team'
        @student.team.update_attributes(captain_id: nil)
        @student.update_attributes(team_id: nil)
        redirect_to team_path(@team)
      end
    }
  end

  def upload
    AdminsHelper.csv_parse(params[:csv].tempfile.to_path.to_s)
    redirect_to '/students'
  end

  private

  def student_params
   params.require(:student).permit(:first_name, :last_name, :gender, :gpa, :number_of_detentions, :sports_teams, :number_of_absences)
  end

end
