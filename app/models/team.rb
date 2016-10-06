class Team < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  belongs_to :captain, class_name: 'Student'

  def self.max_students
    20
  end

end
