class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load_garage(bike)
    bikes.concat bike
  end

  def release_working
    a = bikes.select{|bike| bike.working?}
    bikes.reject!{|bike| bike.working?}
    a
  end

  def fix_bike
    bikes.each{|bike| bike.broken_status = false}
  end

end
