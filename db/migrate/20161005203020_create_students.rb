class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.float :gpa
      t.integer :number_of_detentions
      t.string :sports_teams, array: true, default: []
      t.integer :number_of_absences
      t.integer :team_id
    end
  end
end
