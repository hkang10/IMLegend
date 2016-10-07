require 'csv'
module AdminsHelper


  def self.csv_parse(csv_file)
    CSV.foreach(csv_file, :headers => true, :header_converters => :symbol) do |row|
      student_hash = row.to_hash
      student = Student.create!(student_hash)
      student.add_sports(student_hash[:sports_teams])
    end
  end

end

