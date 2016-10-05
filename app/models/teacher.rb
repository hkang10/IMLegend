class Teacher < ActiveRecord::Base
  has_secure_password

  has_one :team

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
