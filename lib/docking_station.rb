require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop unless bikes[-1].broken?
  end

  def load(bike)
    bikes << bike
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def unload #- previously release_broken_bikes
    a = bikes.select {|i| i.broken?}
    bikes.reject! {|i| i.broken?}
    a
  end
  private
  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
end
