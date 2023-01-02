require 'rails_helper'

RSpec.describe 'studio index page' do
  before(:each) do
    @studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
    @studio2 = Studio.create!(name: 'Disney', location: 'LA')
    @studio3 = Studio.create!(name: 'Happy', location: 'NoHo')
    @studio4 = Studio.create!(name: 'A24', location: 'Utah')
    @movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')
    @movie2 = @studio1.movies.create!(title: 'TopGun', creation_year: 1984, genre: 'action')
    @movie3 = @studio2.movies.create!(title: 'Frozen', creation_year: 2014, genre: 'animation')
    @movie4 = @studio3.movies.create!(title: 'Happy Gilmore', creation_year: 1999, genre: 'comedy')
    @movie5 = @studio4.movies.create!(title: 'Everything Everywhere All At Once', creation_year: 2022, genre: 'meta')
  end
  
  it 'lists all studios name and location' do
    visit '/studios'

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio3.name)
    expect(page).to have_content(@studio4.name)    
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@studio2.location)
    expect(page).to have_content(@studio3.location)
    expect(page).to have_content(@studio4.location)
  end

  it 'lists each of the studios movies including title, year, and genre' do
    visit '/studios'

    within("li#studio#{@studio1.id}") do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.genre)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie2.title)
      expect(page).to have_content(@movie2.genre)
      expect(page).to have_content(@movie2.creation_year)
      expect(page).to_not have_content(@movie3.title)
      expect(page).to_not have_content(@movie4.title)
      expect(page).to_not have_content(@movie5.title)
    end
  end
end
