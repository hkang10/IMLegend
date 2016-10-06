class TeachersController < ApplicationController
  protect_from_forgery with: :exception

  # def index
  #   @teachers = Teacher
  # end

  def new
   @teacher = Teacher.new
  end

  def create
   @teacher = Teacher.new(teacher_params)

   if @teacher.save
     @team = Team.create(teacher_id: @teacher.id, team_name: params[:teacher][:team_name])
     session[:teacher_id] = @teacher.id
     if @teacher.admin? == true
        @teachers = Teacher.all
        redirect_to teacher_path
      else
        redirect_to team_path(@team)
      end
   else
     @errors = @teacher.errors.full_messages
     render :new
   end
  end

  def edit
    @teacher = Teacher.find(params[:id])
    if @teacher.admin? == true
      @teacher.update_attributes(admin?: false)
    else
      @teacher.update_attributes(admin?: true)
    end

    redirect_to teacher_path
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to teacher_path
  end

  private

  def teacher_params
   params.require(:teacher).permit(:first_name, :last_name, :email, :password)
  end
end
