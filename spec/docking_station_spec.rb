require 'docking_station'
require 'rspec/expectations'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it {is_expected.to respond_to(:dock).with(1).argument }
	it {is_expected.to respond_to (:bikes)}

			describe '#releasebike' do
					it 'releases a bike' do
						bike = Bike.new
						subject.dock(bike)
					expect(subject.release_bike).to eq bike
					end
			end

		it "has a working bike" do
				bike = Bike.new
				subject.dock(bike)
			expect(subject.release_bike.working?).to eq true
		end

# it "return docked bikes" do
# 	bike = Bike.new
# 	subject.dock(bike)
# 	expect(subject.bikes).to eq bike
# end

			it "raises exception if no bikes in docking station" do
				expect {subject.release_bike}.to raise_error("No bikes")
			end

		# DEFAULT_CAPACITY=20
		# 	describe "stubbing DEFAULT_CAPACITY" do
		# 		it "can stub DEFAULT_CAPACITY with the different value" do
		# 			stub_const("DEFAULT_CAPACITY", 5)
		# 			expect(DEFAULT_CAPACITY).to eq(5)
		# 		end
		# 		it "restores the stubbed constant when the example complete" do
		# 			expect(DEFAULT_CAPACITY).to eq(20)
		# 		end
		# 	end

			describe '#dock' do
				it "raises exception if docking station is full" do
				DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
				expect {subject.dock(Bike.new)}.to raise_error("Docking Station full")
				end
			end
end
