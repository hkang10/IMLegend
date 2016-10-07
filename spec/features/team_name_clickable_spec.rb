require "rails_helper"

feature "team names are clickable" do
  describe "when teacher sees a team name" do
    it "Link exists" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      teacher2 = Teacher.create!(first_name: 'Tdog', last_name: 'CI', email: 'tmoney@gmail.com', password: 'password1', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student2 = Student.create!(first_name: 'Mark', last_name: 'McGuire', gender: 'F', gpa: 4.8, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 180, team_id: nil)
      student3 = Student.create!(first_name: 'bob', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student4 = Student.create!(first_name: 'eric', last_name: 'McGuire', gender: 'F', gpa: 4.8, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 180, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      team2 = Team.create!(teacher_id: teacher2.id, captain_id: nil, team_name: 'Probably should have gone with name')
      team.students = [student, student2]
      team.save
      team2.students = [student3, student4]
      team2.save
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end
      team.students.each do |student|
        visit student_path(student)
        expect(page).to have_link student.team.team_name
      end
      team2.students.each do |student|
        visit student_path(student)
        expect(page).to have_link student.team.team_name
      end
    end
  end

    describe "when a teacher clicks on a team name" do
      it "directs teacher to the team's show page" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      teacher2 = Teacher.create!(first_name: 'Tdog', last_name: 'CI', email: 'tmoney@gmail.com', password: 'password1', admin?: false)
      student = Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student2 = Student.create!(first_name: 'Mark', last_name: 'McGuire', gender: 'F', gpa: 4.8, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 180, team_id: nil)
      student3 = Student.create!(first_name: 'bob', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: nil)
      student4 = Student.create!(first_name: 'eric', last_name: 'McGuire', gender: 'F', gpa: 4.8, number_of_detentions: 0, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 180, team_id: nil)
      team = Team.create!(teacher_id: teacher.id, captain_id: student.id, team_name: 'Probably should have gone with name')
      team2 = Team.create!(teacher_id: teacher2.id, captain_id: nil, team_name: 'Probably should have gone with name')
      team.students = [student, student2]
      team.save
      team2.students = [student3, student4]
      team2.save
      visit root_path

      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end
      team.students.each do |student|
        visit student_path(student)
        expect(page).to have_link(student.team.team_name, :href => team_path(team))
      end
      team2.students.each do |student|
        visit student_path(student)
        expect(page).to have_link(student.team.team_name, :href => team_path(team2))
      end
    end
  end

end
