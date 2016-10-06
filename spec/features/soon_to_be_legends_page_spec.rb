require "rails_helper"

feature "soon to be legends page" do
  describe "when teacher navigates to the soon to be legends page" do

    scenario "the teacher sees the title (soon to be legends)" do
      teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
      team = Team.create!(teacher_id: teacher.id, captain_id: nil, team_name: 'Probably should have gone with name')
      visit root_path
      within('.login-form') do
        fill_in :email, with: 'tmoney@ymail.com'
        fill_in :password, with: 'password'
        click_button('Login')
      end

      visit students_path
      expect(page).to have_current_path students_path
      expect(page).to have_content("Soon To Be Legends")
    end

    scenario "the teacher sees all/only available students" do
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

      visit students_path
      expect(page).to have_current_path students_path
      expect(page).not_to have_content(student.full_name)
      expect(page).not_to have_content(student2.full_name)
      expect(page).to have_content(student3.full_name)
      expect(page).to have_content(student4.full_name)
    end

  #   xscenario "the teacher sees a checkbox next to each student's name" do
  #   end

  #   xscenario "the teacher sees an 'add all selected students' button" do
  #   end

  #   xscenario "the teacher can click on all checkboxes" do
  #   end

  #   describe "when the teacher clicks 'add all selected students' button" do
  #     it "adds all selected students to teacher's team" do
  #     end

  #     it "removes all selected students from 'soon to be legends' page" do
  #     end

  #     it "redirects the teacher to their homepage" do
  #     end
  #   end

  end
end
