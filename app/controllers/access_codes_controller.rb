class AccessCodesController < ApplicationController

  def update
    confirm_login{
      if current_teacher.admin?
        access_code = AccessCode.first
        access_code.code = params[:access_code][:code]
        access_code.save
        @code = access_code.code
      end
      respond_to do |format|
        format.html {redirect '/'}
        format.js {}
      end
    }
  end
end
