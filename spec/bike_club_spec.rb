require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before :each do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @bikeclub = BikeClub.new("The Speedos")
  end

  describe 'class' do
    it 'exists' do
      expect(@bikeclub).to be_a(BikeClub)
      expect(@bikeclub.name).to eq("The Speedos")
      expect(@bikeclub.members).to eq([])
    end

    it 'can add bikers' do
      @bikeclub.enlist(@biker)
      @bikeclub.enlist(@biker2)
      expect(@bikeclub.members).to eq([@biker, @biker2])
    end
  end

  describe 'most_rides method' do
    it 'can select the rider with the most rides' do
      @bikeclub.enlist(@biker)
      @bikeclub.enlist(@biker2)

      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride2, 65.0)
      @biker2.log_ride(@ride2, 61.5)
      @biker2.log_ride(@ride2, 59.3)

      expect(@bikeclub.most_rides).to eq(@biker)
    end
  end
end