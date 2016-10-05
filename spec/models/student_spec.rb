require 'rails_helper'

describe Student do
  let(:student) { Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: 1) }

  describe "Has readable properties" do
    it "Has a readable first_name" do
      expect(student.first_name).to eq 'Dan'
    end

    it "Has a readable last_name" do
      expect(student.last_name).to eq 'D'
    end

    it 'Has a readable gender' do
      expect(student.gender).to eq 'm'
    end

    it 'Has a readable gpa' do
      expect(student.gpa).to eq 2.5
    end

    it 'Has a readable number_of_detentions' do
      expect(student.number_of_detentions).to eq 8
    end

    it 'Has a readable sports_teams' do
      expect(student.sports_teams).to eq ['Football', 'Foosball', 'Sand Hockey']
    end

    it 'Has a readable number_of_absences' do
      expect(student.number_of_absences).to eq 99
    end

    it 'Has a readable team_id' do
      expect(student.team_id).to eq 1
    end
  end

  describe "associations" do
    it "has a team" do
      new_team = Team.create!(team_name: 'Wolves', teacher_id: 1)
      expect(student.team).to eq new_team
    end
  end
end
