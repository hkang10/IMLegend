require 'csv'
module AdminsHelper


  def self.csv_parse(csv_file)
    CSV.foreach(csv_file, :headers => true, :header_converters => :symbol) do |row|
      Student.create!(row.to_hash)
    end
  end

end

