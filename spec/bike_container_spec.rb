require 'van'
require 'garage'
require 'docking_station'

shared_examples 'container' do
  let (:container) { described_class.new}
  let(:bike) {double(:bike, broken?: false)}
  let(:bike_broken) {double(:bike, broken?: true)}


  describe 'load' do
    it 'collects bikes' do
      expect(subject.load(bike_broken)).to include bike_broken
    end
  end

  describe 'unload' do
    it 'unloads bikes' do
      subject.load(bike_broken)
      expect(subject.unload).to include bike_broken
    end
  end
end
