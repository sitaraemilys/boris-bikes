require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it {is_expected.to respond_to(:dock).with(1).argument }
	it {is_expected.to respond_to (:bike)}

	it 'is of class Bike' do
		expect(subject.release_bike).to be_instance_of Bike
	end

	it "has a working bike" do
		expect(subject.release_bike.working?).to  eq true
	end

it "return docked bikes" do
	bike = Bike.new
	subject.dock(bike)
	expect(subject.bike).to eq bike
end


end
