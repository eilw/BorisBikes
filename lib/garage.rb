require 'bikecontainer'

class Garage

  attr_reader :bikes

  include BikeContainer
  def initialize
    @bikes = []
  end

  def fix_bikes
    bikes.each {|bike| bike.fix_bike}
  end

end
