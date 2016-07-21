require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :bikes, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
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
