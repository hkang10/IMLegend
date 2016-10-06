class AccessCodesController < ApplicationController

  def update
    if current_teacher.admin?
      access_code = AccessCode.first
      access_code.code = params[:code]
      access_code.save
    end
  end
end
