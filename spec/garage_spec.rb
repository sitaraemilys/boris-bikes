require 'garage'

describe Garage do

it {is_expected.to respond_to(:fix)}

  it 'should fix broken bikes' do
    bike = Bike.new.broken
    subject.workshop=([bike])
    subject.fix
    expect(subject.workshop).to eq [(bike.working)]

    #expect{subject.fix}.to change{subject.workshop.each{|bike| bike.working}}.from(false).to(true)

  end

end

# it "should have a workshop" do
#
# end

# it "should fix bikes" do
#   bike = Bike.new
#   broken_bike = bike.broken
#   expect(subject.fix).to eq true
# end
