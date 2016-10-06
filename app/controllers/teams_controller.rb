class TeamsController < ApplicationController
  include TeacherHelper

  def show
    @team = Team.find_by(id: params[:id].to_i)
  end

  def index
    @teams = Team.all
  end

  def update
    @team = Team.find_by(id: params[:id].to_i)
    if current_teacher && current_teacher.id == @team.teacher_id
      @team.update_attributes(team_params)
      @errors = ['Something went wrong!'] if !@team.save
    else
      @errors = ['Something went wrong!']
    end
    render :show
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :captain_id)
  end

end
