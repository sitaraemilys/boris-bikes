require_relative 'bike'

class Garage

  attr_reader :working_bikes

  def initialize
    @working_bikes = []
  end

  def fix_broken_bikes(broken_bikes)
    broken_bikes.each do |bike|
      bike.fix
      @working_bikes << bike
    end
  end    

end
