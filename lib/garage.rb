require 'bike'

 class Garage
 attr_accessor :workshop

  broken_bikes = []
  fixed_bikes = []

  def initialize
    @workshop = []
    #@workshop << Bike.new.broken
  end

   def fix
     @workshop.each{|broken_bike| broken_bike.working = true}
   end
 end
