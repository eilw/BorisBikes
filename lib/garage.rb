
class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load(bike)
    bikes << bike
  end

  def unload
    bikes.pop(bikes.length)
  end

  def fix_bikes
    bikes.each {|bike| bike.fix_bike}
  end

end
