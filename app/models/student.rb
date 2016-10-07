class Student < ActiveRecord::Base
  has_one :captained_team, class_name: 'Team', foreign_key: :captain_id
  belongs_to :team

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :gpa, presence: true
  validates :gpa, numericality: { greater_than_or_equal_to: 0}
  validates :gpa, numericality: { less_than_or_equal_to: 5}
  validates :number_of_detentions, numericality: { greater_than_or_equal_to: 0}
  validates :number_of_absences, numericality: { greater_than_or_equal_to: 0}
  validates :number_of_absences, numericality: { less_than_or_equal_to: 180}

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def add_sports(sports)
    self.sports_teams = []
    arraysport = sports.split(' ')
    arraysport.each do |sport|
      self.sports_teams << sport
    end
    self.save
  end
end
