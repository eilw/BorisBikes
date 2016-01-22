require "docking_station"
require 'bike'

describe DockingStation do

  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}

  it { is_expected.to respond_to :release_bike }

  it_behaves_like 'container'

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end
  end


  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'will not release a broken bike' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument}


  it 'checks if the bike has been docked' do
    expect(subject.dock(bike)).to include bike
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock bike}
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end

  it 'checks capacity can be changed' do
    expect(DockingStation.new(30).capacity).to eq 30
  end

  it 'Checks if no argument passed uses default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_broken_bikes' do
    it 'releases broken bikes to van' do
      subject.dock(bike_broken)
      subject.dock(bike)
      expect(subject.release_broken_bikes).to include bike_broken
    end

    it 'checks the array doesn\'t include working bike' do
      subject.dock(bike_broken)
      subject.dock(bike)
      expect(subject.release_broken_bikes).not_to include bike
    end

    it 'removes broken bikes from dock' do
      subject.dock(bike_broken)
      subject.release_broken_bikes
      expect(subject.bikes).not_to include bike_broken
    end


  end

end
