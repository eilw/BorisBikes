require_relative 'bike'

class DockingStation
  attr_reader :bike

# dockingstation assumes to have no bikes

  def release_bike
    raise "No bikes available!" if @bike == nil
    @bike
  end

  def dock_bike(bike)
    @bike = bike
  end

end
