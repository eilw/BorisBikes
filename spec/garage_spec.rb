require 'garage'

describe Garage do

  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}

  it_behaves_like 'container'

  it 'fixes broken bikes' do
    subject.load(bike_broken)
    allow(bike_broken).to receive(:fix_bike)
    expect(bike_broken).to respond_to(:fix_bike)
    subject.fix_bikes
  end

end
