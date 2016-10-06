module StudentHelper
  def add_sports(sports)
    arraysport = sports.split(',')
    arraysport.each do |sport|
      @sports_team << sport
    end
    @sports_team
  end
end
