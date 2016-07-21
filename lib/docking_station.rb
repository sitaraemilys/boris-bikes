require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :bikes, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY, van=Van)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
    @van = van.new
  end

  def release_bike
    fail 'No bikes here' if empty?
    bikes.pop
  end

  def dock(bike)
    fail 'Dockingstation is full' if full?
    process_bike(bike)
  end

  def intake_from_van(working_bikes)
    working_bikes.each { |bike| @bikes << bike }
  end

  def clear_of_broken_bikes
    @van.collect_from_station(@broken_bikes)
    @broken_bikes = []
  end

private

def full?
  bikes.length >= capacity
end

def empty?
  bikes.empty?
end

def process_bike(bike)
  bike.working? ? bikes << bike : broken_bikes << bike
end

end
