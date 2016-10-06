class SessionsController < ApplicationController
 protect_from_forgery with: :exception

 def new
 end

 def create
  @teacher = Teacher.find_by(email: params[:email])
  @team = @teacher.team
  if @teacher && @teacher.authenticate(params[:password])
    session[:teacher_id] = @teacher.id
    if @teacher.admin? == true
      redirect_to teacher_path
    else
      redirect_to team_path(@team)
    end
  else
    # @errors = teacher.errors.full_messages
    render :new
  end
 end

 def destroy
   session[:teacher_id] = nil
   redirect_to root_path
 end
end
