class TeachersController < ApplicationController
  protect_from_forgery with: :exception

 def new
   @teacher = Teacher.new
 end

 def create
   @teacher = Teacher.new(teacher_params)
   # @team = @teacher.team.create(params[:teacher][:team_name])

   if @teacher.save
     session[:teacher_id] = @teacher.id
     if @teacher.admin? == true
        redirect_to teacher_path
      else
        redirect_to teams_path
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
