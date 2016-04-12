# require "docking_station"

# describe DockingStation do 
#   it "releases bike" do
#     expect(release_bike).to eq "Bike released"
#   end		
# end

require "docking_station"

RSpec.describe DockingStation do 
  describe "release bike" do
  	it{should respond_to(:release_bike)}
  end		
end