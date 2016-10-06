class TeachersController < ApplicationController
  protect_from_forgery with: :exception

 def new
   @teacher = Teacher.new
 end

 def create
   @teacher = Teacher.new(teacher_params)

   if @teacher.save
     @team = Team.create(teacher_id: @teacher.id, team_name: params[:teacher][:team_name])
     session[:teacher_id] = @teacher.id
     if @teacher.admin? == true
        redirect_to teacher_path
      else
        redirect_to team_path(@team)
      end
   else
     @errors = @teacher.errors.full_messages
     render :new
   end
 end

 private

 def teacher_params
   params.require(:teacher).permit(:first_name, :last_name, :email, :password)
 end
end
