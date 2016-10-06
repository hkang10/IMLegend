require "rails_helper"

feature "student names are clickable" do
  describe "when teacher sees a student name" do
    it "Link exists" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student2 = Student.create!(first_name: 'Mark', last_name: 'McGuire', gender: 'F', gpa: 9.5, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 182, team_id: nil)
      student3 = Student.create!(first_name: 'bob', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student4 = Student.create!(first_name: 'eric', last_name: 'McGuire', gender: 'F', gpa: 9.5, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 182, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      team.students = [student, student2]
      team.save
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end
      visit team_path(team)
      expect(page).to have_current_path team_path(team)
      team.students.each do |team_student|
        expect(page).to have_link team_student.full_name
      end

      visit students_path
      expect(page).to have_current_path students_path
      expect(page).to have_link student3.full_name
      expect(page).to have_link student4.full_name
    end

    describe "when a teacher clicks on a student name" do
      it "directs teacher to the student's show page" do
        teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
        student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
        student2 = Student.create!(first_name: 'Mark', last_name: 'McGuire', gender: 'F', gpa: 9.5, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 182, team_id: nil)
        student3 = Student.create!(first_name: 'bob', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
        student4 = Student.create!(first_name: 'eric', last_name: 'McGuire', gender: 'F', gpa: 9.5, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 182, team_id: nil)
        team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
        team.students = [student, student2]
        team.save
        visit root_path

        within('.login-form') do
          fill_in :email, with: 'tmoney@ymail.com'
          fill_in :password, with: 'password'
          click_button('Login')
        end
        visit team_path(team)
        expect(page).to have_current_path team_path(team)
        team.students.each do |team_student|
          expect(page).to have_link(team_student.full_name, :href => student_path(team_student))
        end

        visit students_path
        expect(page).to have_current_path students_path
        expect(page).to have_link student3.full_name
        expect(page).to have_link student4.full_name
      end
    end
  end

end
