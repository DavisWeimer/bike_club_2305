class Biker
  attr_reader :name,
              :distance,
              :rides,
              :acceptable_terrain
  def initialize(name, distance)
    @name = name
    @distance = distance
    @rides = {}
    @acceptable_terrain = []
  end
end