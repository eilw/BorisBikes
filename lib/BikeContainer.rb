module BikeContainer

  def load(bike)
    bikes << bike
  end

  def unload
    bikes.pop(bikes.length)
  end

end
