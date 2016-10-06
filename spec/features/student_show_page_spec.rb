require "rails_helper"

feature "student's show page" do
  describe "when teacher navigates to a student's show page" do

    scenario "the teacher sees the student's name" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      expect(page).to have_content student.full_name
    end

    scenario "the teacher sees the student's gpa" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      expect(page).to have_content student.gpa
    end

    scenario "the teacher sees the student's gender" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      expect(page).to have_content "Gender: #{student.gender}"
    end

    scenario "the teacher sees the student's number of detention" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      expect(page).to have_content student.number_of_detentions
    end

    scenario "the teacher sees the student's sports team" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      student.sports_teams.each { |team| expect(page).to have_content team }

    end

    scenario "the teacher sees the student's number of absences" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit student_path(student)
      expect(page).to have_current_path student_path(student)
      expect(page).to have_content student.number_of_absences
    end

    describe "when the student is already on a team" do
      xscenario "the teacher sees the student's team name" do
      end
    end

    describe "when the student is available" do
      xscenario "the teacher sees an 'add to my team' button" do
      end
    end

    describe "when the student is already on the teacher's team" do
      xscenario "the teacher sees a 'make new captain' button" do
      end
    end

  end
end
