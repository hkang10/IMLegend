teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
team = Team.create!(teacher_id: teacher.id, captain_id: nil, team_name: 'Probably should have gone with name')
Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: team.id)
student = Student.create!(first_name: 'Mark', last_name: 'M', gender: 'm', gpa: 3.95, number_of_detentions: 4, sports_teams: ['Tennis'], number_of_absences: 23, team_id: team.id)
teacher2 = Teacher.create!(first_name: 'Client', last_name: 'Pete', email: 'pmoney@ymail.com', password: 'password', admin?: false)
team2 = Team.create!(teacher_id: teacher2.id, captain_id: nil, team_name: 'Wolves')
Student.create!(first_name: 'Milli', last_name: 'Vanilli', gender: 'M', gpa: 1.8, number_of_detentions: 0, sports_teams: [], number_of_absences: 0, team_id: team2.id)
student2 = Student.create!(first_name: 'Mark', last_name: 'M', gender: 'm', gpa: 3.95, number_of_detentions: 4, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 23, team_id: team.id)

Student.create!(first_name: 'Erica', last_name: 'D', gender: 'F', gpa: 1.2, number_of_detentions: 5, number_of_absences: 14, team_id: nil)
Student.create!(first_name: 'Barb', last_name: 'L', gender: 'F', gpa: 1.2, number_of_detentions: 5, sports_teams: ['Football'], number_of_absences: 14, team_id: nil)

team.captain = student
team.save

admin = Teacher.create!(first_name: 'Admin', last_name: 'Admin', email: 'admin@admin.org', password: 'admin', admin?: true)

admin_team = Team.create!(teacher_id: admin.id, captain_id: nil, team_name: 'Admin Team')