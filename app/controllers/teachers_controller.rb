class TeachersController < ApplicationController
  protect_from_forgery with: :exception

  def index
    confirm_login{
      @students = Student.all
    }
  end

  def new
   @teacher = Teacher.new
  end

  def show
    confirm_login{
      render :show
    }
  end

  def create
    @teacher = Teacher.new(teacher_params)
    team_name = params[:teacher][:team_name]
    @team = Team.new(team_name: team_name)
    if params[:teacher][:access_code] == AccessCode.first.code && team_name.length > 1

      if @teacher.save
       @team = Team.create(teacher_id: @teacher.id, team_name: team_name)
       session[:teacher_id] = @teacher.id
       if @teacher.admin? == true
          @teachers = Teacher.all
          redirect_to teacher_path
        else
          redirect_to team_path(@team)
        end
      else
       @errors = @teacher.errors.full_messages + @team.errors.full_messages
       render :new
      end
    else

      @errors=['Incorrect access code']
      render :new
    end
  end

  def update
    confirm_login{
      @teacher = Teacher.find(params[:id].to_i)
      if @teacher.admin? == true
        @teacher.update_attributes(admin?: false)
      else
        @teacher.update_attributes(admin?: true)
      end
      respond_to do |format|
        format.html { redirect_to teacher_path }
        format.js {}
      end
    }
  end

  def destroy
    confirm_login{
      @teacher = Teacher.find(params[:id].to_i)
      @teacher.destroy

      redirect_to teacher_path
    }
  end

  private

  def teacher_params
   params.require(:teacher).permit(:first_name, :last_name, :email, :password)
  end
end
