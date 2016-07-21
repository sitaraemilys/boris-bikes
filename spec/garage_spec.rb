require 'garage'

describe Garage do

  let(:bike) { double(:bike, working: true) }
  let(:broken_bike) { double(:bike, working: false, fix: false) }
  let(:van) { double(:van) }
  let(:docking_station) { double(:docking_station) }

  describe '#initialize' do
    it 'starts with an empty array of working bikes' do
      expect(subject.working_bikes).to be_empty
    end
  end

  describe '#fix_broken_bikes' do
    it 'turns broken bikes into working bikes' do
      subject.fix_broken_bikes([broken_bike])
      expect(subject.working_bikes.length).to eq 1
    end
  end

  describe '#clear_of_working_bikes' do
    it 'contains no more working bikes' do
      subject.fix_broken_bikes([broken_bike])
      subject.clear_of_working_bikes
      expect(subject.working_bikes).to be_empty
    end
  end



end
