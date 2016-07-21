require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  describe '#initialize' do

    it 'is working' do
      expect(subject.broken).to eq false
    end

  end

  describe '#report_broken' do
    it 'reports the bike broken' do
      subject.report_broken
      expect(subject.broken).to eq true
    end
  end

  describe '#fix' do
    it 'fixes the bike' do
      subject.report_broken
      subject.fix
      expect(subject.working?).to eq true
    end
  end

end
