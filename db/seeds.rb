teacher = Teacher.create!(first_name: 'Travis', last_name: 'CI', email: 'tmoney@ymail.com', password: 'password', admin?: false)
team = Team.create!(teacher_id: teacher.id, captain_id: nil, team_name: 'Probably should have gone with name')
Student.create!(first_name: 'Dan', last_name: 'D', gender: 'm', gpa: 2.5, number_of_detentions: 8, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 99, team_id: team.id)
student = Student.create!(first_name: 'Mark', last_name: 'M', gender: 'm', gpa: 3.95, number_of_detentions: 4, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 23, team_id: team.id)
Student.create!(first_name: 'Bob', last_name: 'D', gender: 'm', gpa: 1.2, number_of_detentions: 5, sports_teams: ['Football', 'Foosball', 'Sand Hockey'], number_of_absences: 14, team_id: nil)

team.captain = student
team.save
