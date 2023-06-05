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

  def learn_terrain!(terrain_type)
    
    @acceptable_terrain.push(terrain_type)
  end

  def log_ride(ride_type, time )
    if @rides[ride_type]
      @rides[ride_type].push(time)
    else
      @rides[ride_type] = [time]
    end
  end

  def personal_record(ride_type)
    @rides[ride_type].min
  end
end