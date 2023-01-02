require 'rails_helper'

RSpec.describe 'movies show page' do
  before(:each) do
    @studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')
    @actor1 = @movie1.actors.create!(name: 'Tom Cruise', age: 51)
    @actor2 = @movie1.actors.create!(name: 'Jennifer Connelly', age: 49)
    @actor3 = @movie1.actors.create!(name: 'Miles Teller', age: 29)
    @actor4 = @movie1.actors.create!(name: 'Val Kilmer', age: 58)
    @actor5 = Actor.create!(name: 'Jon Hamm', age: 45)
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
    
    expect(page).to have_content('Average age of all actors on this movie: 46.75')
  end

  it 'does not show actors that are not in the movie' do
    visit "/movies/#{@movie1.id}"

    expect(page).to_not have_content(@actor5.name)
  end

  it 'has a form that can be used to add an actor to the movie' do
    visit "/movies/#{@movie1.id}"

    expect(page).to_not have_content(@actor5.name)
    expect(page).to_not have_content(@actor5.age)

    fill_in('actor_id', with: @actor5.id)
    click_button('Submit')

    expect(current_path).to eq("/movies/#{@movie1.id}")
    expect(page).to have_content(@actor5.name)
    expect(page).to have_content(@actor5.age)
  end
end
