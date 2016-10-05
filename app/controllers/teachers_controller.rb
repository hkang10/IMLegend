class TeachersController < ApplicationController
  protect_from_forgery with: :exception

 def new
   @teacher = Teacher.new
 end

 def create
   @teacher = Teacher.new(teacher_params)
   @team = @teacher.team.create(params[:team_name])

   if @teacher.save
     session[:teacher_id] = @teacher.id
     redirect_to root_path
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
