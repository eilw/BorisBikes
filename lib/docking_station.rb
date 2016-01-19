class DockingStation
  attr_reader :no_bikes, :bike

  def initialize (nr=1)
    @no_bikes = nr
  end

  def release_bike
    raise "No bikes available" if @no_bikes <= 0
    Bike.new
  end

  def dock_bike(bike)
    @no_bikes += 1 if bike.kind_of? Bike
    @bike = bike
  end


  def available
    @no_bikes > 0 ? true : false
  end
end

class Bike
  def working?
    true
  end
end
