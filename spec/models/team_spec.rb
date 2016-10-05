require 'rails_helper'

describe Team do
  let(:team) { Team.new(teacher_id: 1, captain_id: 12, team_name: 'Probably should have gone with name') }

  describe "Has readable properties" do
    it "Has a readable teacher_id" do
      expect(team.teacher_id).to eq 1
    end

    it "Has a readable captain_id" do
      expect(team.captain_id).to eq 12
    end

    it 'Has a readable name' do
      expect(team.team_name).to eq 'Probably should have gone with name'
    end
  end
end
