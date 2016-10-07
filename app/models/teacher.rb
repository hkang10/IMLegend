class Teacher < ActiveRecord::Base
  has_secure_password
  has_one :team

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\S+@\S+\.\S/,
    message: "must be a valid email address" }
  validates :email, uniqueness: true


  def full_name
    self.first_name + ' ' + self.last_name
  end
end
