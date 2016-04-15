require 'bike'
describe Bike do

it {is_expected.to respond_to :working}

it "will report a bike as broken" do
	bike = Bike.new
	broken_bike = bike.broken
  expect(broken_bike.working).to eq false
end

end
