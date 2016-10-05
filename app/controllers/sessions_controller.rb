class SessionsController < ApplicationController
 protect_from_forgery with: :exception

 def new
 end

 def create
   teacher = Teacher.find_by(email: params[:email])

   if teacher && teacher.authenticate(params[:password])
     session[:teacher_id] = teacher.id
     redirect_to teams_path
   else
     @errors = teacher.errors.full_messages
     render :new
   end
 end

 def destroy
   session[:teacher_id] = nil
   redirect_to root_path
 end
end
