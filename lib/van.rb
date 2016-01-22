require 'bike'
require 'BikeContainer'

class Van
  include BikeContainer
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def unload_broken_bikes
    a = bikes.select {|i| i.broken?}
    bikes.reject! {|i| i.broken?}
    a
  end

  def unload_working_bikes
    a = bikes.reject {|i| i.broken?}
    bikes.select! {|i| i.broken?}
    a
  end

end
