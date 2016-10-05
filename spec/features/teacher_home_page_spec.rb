require "rails_helper"

feature "teacher's own home page" do
  describe "when teacher navigates to their home page" do
    # let(:teacher) { Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false) }
    # let(:team) { Team.create!(teacher_id: teacher.id, captain_id: 12, team_name: 'Probably should have gone with name') }

    scenario "the teacher sees their team name" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      team = Team.create!(teacher_id: teacher.id, captain_id: 12, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      expect(page).to have_content team.team_name
    end

    scenario "the teacher sees their team captain" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      expect(page).to have_content team.captain.full_name
    end

    scenario "the teacher sees their own name" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      expect(page).to have_content teacher.full_name
    end

    scenario "the teacher sees a list of students on team" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student1 = Student.create!(first_name: 'Mark', last_name: 'M', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      team.students = [student, student1]
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      expect(page).to have_content student.full_name
      expect(page).to have_content student1.full_name
    end

    scenario "the teacher sees an add students button" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      team = Team.create!(teacher_id: teacher.id, captain_id: nil, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      click_link('+ student')
      expect(page).to have_current_path students_path

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
