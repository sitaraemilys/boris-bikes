require 'docking_station'

describe DockingStation do 	
	it {is_expected.to respond_to :release_bike} 

	it 'is of class Bike' do
		expect(subject.release_bike).to be_instance_of Bike
	end

	it "has a working bike" do
		expect(subject.release_bike.working?).to  eq true
	end
	
end
