require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end

  before(:each) do
    @studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')

    @movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')

    @actor1 = @movie1.actors.create!(name: 'Tom Cruise', age: 51)
    @actor2 = @movie1.actors.create!(name: 'Jennifer Connelly', age: 49)
    @actor3 = @movie1.actors.create!(name: 'Miles Teller', age: 29)
    @actor4 = @movie1.actors.create!(name: 'Val Kilmer', age: 58)

    @movie2 = @studio1.movies.create!(title: 'SpongeBob Movie', creation_year: 2020, genre: 'animation')

    @actor5 = @movie2.actors.create!(name: 'Jon Hamm', age: 45)
    @actor6 = @movie2.actors.create!(name: 'Michael Scarn', age: 48)
    ActorMovie.create!(actor_id: @actor1.id, movie_id: @movie2.id)

    @actor7 = Actor.create!(name: 'Dwigt', age: 46)
  end

  describe '#actors' do
    it 'returns unique list of actors from this studios movies' do
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors).to include(@actor1)
      expect(@studio1.actors.length).to eq(6)
    end
  end
end
