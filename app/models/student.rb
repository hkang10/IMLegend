class Student < ActiveRecord::Base
  has_one :captained_team, class_name: 'Team', foreign_key: :captain_id
  belongs_to :team
end
