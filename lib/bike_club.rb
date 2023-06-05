class BikeClub
  attr_reader :name,
              :members

  def initialize(name)
    @name = name
    @members = []
  end

  def enlist(biker)
    @members.push(biker)
  end

  def most_rides
    # require 'pry'; binding.pry
    @members.find {|biker| biker.rides.values.flatten.max}
  end
end