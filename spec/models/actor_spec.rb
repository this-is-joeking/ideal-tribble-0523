require 'rails_helper'

RSpec.describe Actor do
  before(:each) do
    @actor1 = Actor.create!(name: 'Tom Cruise', age: 51)
    @actor2 = Actor.create!(name: 'Jennifer Connelly', age: 49)
    @actor3 = Actor.create!(name: 'Miles Teller', age: 29)
    @actor4 = Actor.create!(name: 'Val Kilmer', age: 58)
    @actor5 = Actor.create!(name: 'MilleBobby Brown', age: 20)
  end

  describe '#sort_by_age' do
    it 'sorts all actors by age from youngest to oldest' do
      expect(Actor.sort_by_age).to eq([@actor5, @actor3, @actor2, @actor1, @actor4])

      actor6 = Actor.create!(name: 'test', age: 100)
      actor7 = Actor.create!(name: 'test', age: 1)
      
      expect(Actor.sort_by_age).to eq([actor7, @actor5, @actor3, @actor2, @actor1, @actor4, actor6])
    end
  end

  describe '#avg_age' do
    it 'returns the average age of the actors' do
      expect(Actor.avg_age).to eq(41.4)

      actor6 = Actor.create!(name: 'test', age: 100)
      actor7 = Actor.create!(name: 'test', age: 1)

      expect(Actor.avg_age).to eq(44)
    end
  end
end