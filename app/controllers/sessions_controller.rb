class SessionsController < ApplicationController
 protect_from_forgery with: :exception

 def new
 end

 def create
  @teacher = Teacher.find_by(email: params[:email])
  if @teacher && @teacher.authenticate(params[:password])
    @team = @teacher.team
    session[:teacher_id] = @teacher.id
    if @teacher.admin? == true
      redirect_to teacher_path(@teacher)
    else
      redirect_to team_path(@team)
    end
  else
    @errors = ['Email or password incorrect']
    respond_to do |format|
      format.html { render :new }
      format.js {}
    end
  end
 end

 def destroy
   session[:teacher_id] = nil
   redirect_to root_path
 end
end
