module TeacherHelpers

  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
  end

end
