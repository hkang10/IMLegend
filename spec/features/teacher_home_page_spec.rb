require "rails_helper"

feature "teacher's own home page" do
  describe "when teacher navigates to their home page" do
    let(:teacher) { Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false) }
    let(:team) { Team.create!(teacher_id: teacher.id, captain_id: 12, team_name: 'Probably should have gone with name') }

    scenario "the teacher sees their team name" do
      visit root_path
      within('.login-form') do
        fill_in :'teacher[email]', with: 'tmoney@ymail.com'
        fill_in :'teacher[password]', with: 'password'
        click_button('Save Teacher')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      expect(page).to have_content team.name
    end

    xscenario "the teacher sees their team captain" do
    end

    xscenario "the teacher sees their own name" do
    end

    xscenario "the teacher sees a list of students on team" do
    end

    xscenario "the teacher sees an add students button" do
    end

    xscenario "the teacher sees a 'make new captain' button next to each student's name" do
    end

    describe "when the teacher clicks 'make new captain' button" do

      it "removes the incumbent captain from captain section" do
      end

      it "moves selected student to captain section" do
      end
    end

    describe "when the teacher clicks 'remove captain' button" do
      it "removes the incumbent captain from captain section" do
      end

      it "leaves the captain section empty" do
      end
    end
  end
end
