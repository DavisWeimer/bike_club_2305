class Ride
  attr_reader :name,
              :distance,
              :loop,
              :terrain
  def initialize(ride_traits)
    @name = ride_traits[:name]
    @distance = ride_traits[:distance]
    @loop = ride_traits[:loop]
    @terrain = ride_traits[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop 
      @distance
    else
      @distance *= 2
    end
  end

end