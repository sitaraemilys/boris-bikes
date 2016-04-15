require 'docking_station'
require 'rspec/expectations'

describe DockingStation do

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
					it 'releases a bike' do
						bike = Bike.new
						subject.dock(bike)
						expect(subject.release_bike).to eq bike
					end
					it "has a working bike" do
						bike = Bike.new
						subject.dock(bike)
						expect(subject.release_bike.working).to eq true
					end
					it "raises exception if no bikes in docking station" do
						expect {subject.release_bike}.to raise_error("No bikes")
					end

					it "raises exception if you are trying to take out a broken bike" do
						broken_bike = Bike.new.broken
						subject.dock(broken_bike)
					  expect {subject.release_bike}.to raise_error("Sorry, this bike is broken")
					end
			end

			describe '#dock' do
					it "raises exception if docking station is full" do
						subject.capacity.times {subject.dock(Bike.new)}
						expect {subject.dock(Bike.new)}.to raise_error("Docking Station full")
					end

					it "accepts a broken bike" do
						bike = Bike.new
						broken_bike = bike.broken
						subject.dock(broken_bike)
						expect(@bikes.last).to eq broken_bike
					end
			end
end
