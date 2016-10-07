class Team < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  belongs_to :captain, class_name: 'Student'

  validates :team_name, presence: true
  validates :teacher, presence: true

  def self.max_students
    20
  end

end
