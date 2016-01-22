require 'van'

describe Van do

  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}

  it 'collects bikes' do
    expect(subject.load(bike_broken)).to include bike_broken
  end

  it 'unloads bikes' do
    subject.load(bike)
    expect(subject.unload).to include bike
  end

  it 'unloads broken bikes' do
    subject.load(bike_broken)
    subject.load(bike)
    expect(subject.unload_broken_bikes).to include bike_broken
  end

  it 'unloads working bikes' do
    subject.load(bike_broken)
    subject.load(bike)
    expect(subject.unload_working_bikes).to include bike
  end

end
