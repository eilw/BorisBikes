class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' unless bikes[-1].bike_status
    bikes.pop
  end

  def bike_report(returned_bike, status=true)
    returned_bike.bike_status = status
    dock_bike(returned_bike) #if status
    status
  end

  def dock_bike(bike)
    raise "No space!" if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end

class Bike
  attr_accessor :bike_status
  def initialize
    @bike_status = true
  end

  def working?
    bike_status
  end

end
