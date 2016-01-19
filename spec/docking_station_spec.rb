require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  describe '#relase_bike' do
    it 'releases a bike' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  it { is_expected. to respond_to(:dock_bike).with(1).argument }

  it 'no bikes available error' do
    station = DockingStation.new 0
    expect {station.release_bike}.to raise_error("No bikes available")
  end

  it 'dock_bike increase no_people by one' do
    bike = Bike.new
    expect{subject.dock_bike(bike)}.to change{subject.no_bikes}.by(1)
  end
  it { is_expected. to respond_to :available }

  it 'returns bikes that are docked' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end

end


=begin
#Why does this not work?
if (subject.no_bikes == 0)
  it { expect(subject.available).to be_false }
end
#if (subject.no_bikes >= 1)
#  it { expect(subject.available).to be_true }
#end

=end
