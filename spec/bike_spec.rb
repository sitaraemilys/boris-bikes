require 'bike'
describe Bike do

it {is_expected.to respond_to :working?}

it "will report a bike as broken" do
	bike = Bike.new
 expect(bike.report).to eq false
end

end
