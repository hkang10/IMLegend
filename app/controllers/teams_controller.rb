class TeamsController < ApplicationController

  def show
    @team = Team.find_by(id: params[:id])
  end

  def update
    team = Team.find_by(id: params[:id])
    team.update_attributes(team_params)
    @errors = ['Something went wrong!'] if !team.save
    redirect_to team_path(team)
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :captain_id)
  end

end
