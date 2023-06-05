require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before :each do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
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

  describe 'learn_terrain! method' do
    it 'can add terrain' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe 'log_ride and personal_record method' do
    it 'can log all rides' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides).to eq({@ride1=>[92.5, 91.1],@ride2=>[60.9, 61.6]})
    end

    it 'can log personal record for each ride' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end

  describe 'biker2' do
    it 'cannot log rides on on unlearned terrain' do
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)
      expect(@biker2.rides).to eq({})
    end

    it 'learns the terrain and takes some rides' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)
      @biker2.rides.delete(@ride1)
      expect(@biker2.rides).to eq({@ride2=>[65.0]})
      expect(@biker2.personal_record(@ride2)).to eq (65.0)
      expect(@biker2.personal_record(@ride1)).to eq (false)
    end
  end
end