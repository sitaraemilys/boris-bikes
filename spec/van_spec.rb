require 'van'

describe Van do

  let(:bike) { double(:bike, working: true) }
  let(:broken_bike) { double(:bike, working: false) }

  describe '#initialize' do
    it 'has an empty array of broken bikes' do
      expect(subject.broken_bikes).to be_empty
    end

    it 'has an empty array of working bikes' do
      expect(subject.working_bikes).to be_empty
    end
  end

  describe '#collect_from_station' do
    it 'collects the broken bikes from the docking station' do
      subject.collect_from_station([broken_bike])
      expect(subject.broken_bikes).to eq [broken_bike]
    end
  end

  describe '#deliver_to_garage' do
    it 'delivers the broken bikes to the garage' do
      subject.collect_from_station([broken_bike])
      subject.deliver_to_garage(subject.broken_bikes)
      expect(subject.broken_bikes).to be_empty
    end
  end

  describe '#collect_from_garage' do
    it 'collects the working bikes from the garage' do
      subject.collect_from_garage([bike])
      expect(subject.working_bikes).to eq [bike]
    end
  end

  describe '#deliver_to_station' do
    it 'delivers the working bikes to the docking station' do
      subject.collect_from_garage([bike])
      subject.deliver_to_station([bike])
      expect(subject.working_bikes).to be_empty
    end
  end


end
