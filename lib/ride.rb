class Ride
  attr_reader :name,
              :distance,
              :loop,
              :terrain
  def initialize(ride_traits)
    @name = ride_traits[:name]
    @distance = ride_traits[:distance]
    @loop = false
    @terrain = ride_traits[:terrain]
  end

end