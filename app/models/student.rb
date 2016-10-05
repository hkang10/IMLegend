class Student < ActiveRecord::Base
  has_one :captained_team, class_name: 'Team', foreign_key: :captain_id
  belongs_to :team

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
