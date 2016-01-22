require 'van'
require 'bike_container_spec'

describe Van do

  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}

  it_behaves_like 'container'


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
