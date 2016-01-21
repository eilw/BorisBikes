require 'docking_station'

describe DockingStation do

  #let(:bike) {double(:bike, working?: true,
  #  broken?: false)}

  let(:bike) {double(:bike, working?: true)}
  let(:broken_bike) {double(:bike, working?: false)}

  it { is_expected.to respond_to(:release_bike) }

  it 'check if bike is working' do
    #allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'dock bike' do
    expect(subject.dock_bike(bike)).to include bike
  end

  it 'check the same bike exists' do
    subject.dock_bike(bike)
    expect(subject.bikes).to include bike
  end

  it 'release a bike when it is available' do
    #allow(bike).to receive(:broken?).and_return(false)
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raise an error when no bikes are available' do
    expect { subject.release_bike }.to raise_error("No bikes available!")
  end

  it 'raise an error when station is full' do
    subject.capacity.times { subject.dock_bike(bike) }
    expect { subject.dock_bike(bike) }.to raise_error("Station is full!")
  end

  it 'should release all broken bikes' do
     bikes = [
     broken_bike1 = broken_bike,
     broken_bike2 = broken_bike,
     working_bike3 = bike]
     bikes.each {|bike| subject.dock_bike(bike)}
     expect(subject.release_broken).to include broken_bike1, broken_bike2
  end

  it 'should not have any of the released bikes in the station' do
     bikes = [
     broken_bike1 = broken_bike,
     broken_bike2 = broken_bike,
     working_bike3 = bike]
     bikes.each {|bike| subject.dock_bike(bike)}
     subject.release_broken
     expect(subject.bikes).not_to include broken_bike1
  end

  it 'enable multiple bikes to be docked' do
    bikes = [
    broken_bike1 = broken_bike,
    broken_bike2 = broken_bike,
    working_bike3 = bike]
    subject.dock_bike(bikes)
    expect(subject.bikes).to include broken_bike1, broken_bike2, working_bike3

  end


end
