require 'garage'

describe Garage do

  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}

  it 'collects broken bikes' do
    expect(subject.load(bike_broken)).to include bike_broken
  end

  it 'unloads working bikes' do
    subject.load(bike)
    expect(subject.unload).to include bike
  end

  it 'fixes broken bikes' do
    subject.load(bike_broken)
    allow(bike_broken).to receive(:fix_bike)
    expect(bike_broken).to respond_to(:fix_bike)
    subject.fix_bikes
  end

end
