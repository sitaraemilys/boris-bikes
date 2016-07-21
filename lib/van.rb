require_relative 'docking_station'
require_relative 'garage'

class Van

  attr_reader :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_from_station(broken_bikes)
    broken_bikes.each { |bike| @broken_bikes << bike }
  end

  def deliver_to_garage(broken_bikes)
    @broken_bikes = []
  end

  def collect_from_garage(working_bikes)
    working_bikes.each { |bike| @working_bikes << bike }
  end

  def deliver_to_station(working_bikes)
    @working_bikes = []
  end

end
