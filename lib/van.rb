require 'bike'

class Van

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
