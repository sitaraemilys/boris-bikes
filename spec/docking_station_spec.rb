require 'docking_station'
require 'rspec/expectations'

describe DockingStation do

	let(:bike) {double(:bike, working: true)}
	let(:broken_bike) {double(:broken_bike, working: false)}

			it {is_expected.to respond_to(:release_bike)}
			it {is_expected.to respond_to(:dock).with(1).argument}
			it {is_expected.to respond_to(:bikes)}

			describe '#initialize' do
						it "has a variable capacity" do
							capacity = 123
							station = DockingStation.new(capacity)
							expect(station.capacity).to eq capacity
						end
						it "sets the the capacity to default value when capacity is not provided" do
							expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
						end
			end

			describe '#releasebike' do
					it "releases a working bike" do
						subject.dock(bike)
						expect(subject.release_bike.working).to eq true
					end
					it "raises exception if no bikes in docking station" do
						expect {subject.release_bike}.to raise_error("No bikes")
					end

					it "raises exception if you are trying to take out a broken bike" do
						subject.dock(broken_bike)
					  expect {subject.release_bike}.to raise_error("Sorry, this bike is broken")
					end
			end

			describe '#dock' do
					it "raises exception if docking station is full" do
						subject.capacity.times {subject.dock(bike)}
						expect {subject.dock(bike)}.to raise_error("Docking Station full")
					end

					it "accepts a broken bike" do
						subject.dock(broken_bike)
						expect(subject.bikes.last).to eq broken_bike
					end
			end
end
