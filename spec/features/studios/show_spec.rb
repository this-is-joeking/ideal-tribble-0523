require 'rails_helper'

RSpec.describe 'studio show page' do
  before(:each) do
    @studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')
    @actor1 = @movie1.actors.create!(name: 'Tom Cruise', age: 51)
    @actor2 = @movie1.actors.create!(name: 'Jennifer Connelly', age: 49)
    @actor3 = @movie1.actors.create!(name: 'Miles Teller', age: 29)
    @actor4 = @movie1.actors.create!(name: 'Val Kilmer', age: 58)
    @actor5 = Actor.create!(name: 'Jon Hamm', age: 45)
    @actor6 = Actor.create!(name: 'Michael Scarn', age: 48)
    @actor7 = Actor.create!(name: 'Dwigt', age: 46)
  end

  it 'lists the studios name and location' do
    visit "/studios/#{@studio1.id}"
    save_and_open_page
    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
  end

  it 'shows list of actors that have worked on that studios movies' do
    visit "/studios/#{@studio1.id}"

    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor3.name)    
    expect(page).to have_content(@actor4.name)
    expect(page).to_not have_content(@actor5.name)
    expect(page).to_not have_content(@actor6.name)
    expect(page).to_not have_content(@actor7.name)
  end
end

