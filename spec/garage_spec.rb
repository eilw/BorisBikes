require 'garage'

describe Garage do
  let(:bike) {double(:bike, working?: true)}
  let(:broken_bike) {double(:bike, working?: false)}
  before (:each) do
    bike1_w, bike2_w, bike3_b = bike, bike, broken_bike
    @test_bikes = [bike1_w,bike2_w,bike3_b]
  end

  it 'a single bike can be loaded' do
  end


  it 'bikes can be loaded into the garage' do
    expect(subject.load_garage(@test_bikes)).to include bike
  end

  it 'can take bikes out of garage' do
    subject.load_garage(@test_bikes)
    expect(subject.release_working).to include bike
  end

  it 'only takes out working bikes from garage' do
    subject.load_garage(@test_bikes)
    expect(subject.release_working).not_to include broken_bike
  end

end
=begin
  it 'fixes broken bikes' do
    allow(@test_bikes).to receive(:fix_bike).and_return(false)
    allow(@test_bikes).to receive(:working?).and_return(true)
    allow(@test_bikes).to receive(:broken_status=).and_return(false)
    subject.fix_bike(@test_bikes)
    expect(broken_bike.working?).to eq(true)
  end

=end
