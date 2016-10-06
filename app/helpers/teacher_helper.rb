module TeacherHelper

  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
  end

  def logged_in?
    !!current_teacher
  end

end
