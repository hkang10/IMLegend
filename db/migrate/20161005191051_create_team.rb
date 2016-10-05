class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :captain_id
      t.integer :teacher_id
    end
  end
end
