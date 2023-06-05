require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before :each do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker = Biker.new("Kenny", 30)
  end

  describe 'class' do
    it 'exists' do
      expect(@biker).to be_a(Biker)
      expect(@biker.name).to eq("Kenny")
      expect(@biker.distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end
end