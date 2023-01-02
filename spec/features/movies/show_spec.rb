require 'rails_helper'

RSpec.describe 'movies show page' do
  before(:each) do
    @studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')
    @actor1 = Actor.create!(name: 'Tom Cruise', age: 51)
    @actor2 = Actor.create!(name: 'Jennifer Connelly', age: 49)
    @actor3 = Actor.create!(name: 'Miles Teller', age: 29)
    @actor4 = Actor.create!(name: 'Val Kilmer', age: 58)

    ActorMovie.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @actor2.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @actor3.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @actor4.id)
  end

  it 'shows movies title, year and genre' do
    visit "/movies/#{@movie1.id}"

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)
  end

  it 'lists all actors from youngest to oldest' do
    visit "/movies/#{@movie1.id}"

    expect(@actor3.name).to appear_before(@actor2.name)
    expect(@actor2.name).to appear_before(@actor1.name)    
    expect(@actor1.name).to appear_before(@actor4.name)
  end

  it 'provides average age for all actors on the movie' do
    visit "/movies/#{@movie1.id}"
    save_and_open_page
    expect(page).to have_content('Average age of all actors on this movie: 46.75')
  end
end
