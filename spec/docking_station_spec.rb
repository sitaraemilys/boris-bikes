require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike, broken: false, working?: true }
  let(:broken_bike) { double :bike, broken: true, working?: false }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it 'unique capacity can be inputted' do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq 50
    end

    it 'contains no working bikes' do
      expect(subject.bikes).to be_empty
    end

    it 'contains no broken bikes' do
      expect(subject.broken_bikes).to be_empty
    end
  end

  describe '#release_bike' do
    it 'releases a working bike' do
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'raises an error if no bikes' do
      error = 'No bikes here'
      expect{ subject.release_bike }.to raise_error error
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'raises an error if the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      error = 'Dockingstation is full'
      expect{ subject.dock(bike) }.to raise_error error
      end

      it 'transfers broken bikes to their own group' do
        subject.dock(broken_bike)
        expect(subject.broken_bikes).to eq [broken_bike]
      end
    end

    describe '#intake_from_van' do
      it 'recieves working bikes from the van' do
        subject.intake_from_van([bike])
        expect(subject.bikes).to eq [bike]
      end
    end


end
