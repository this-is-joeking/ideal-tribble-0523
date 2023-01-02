# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
@studio2 = Studio.create!(name: 'Disney', location: 'LA')
@studio3 = Studio.create!(name: 'Happy', location: 'NoHo')
@studio4 = Studio.create!(name: 'A24', location: 'Utah')
@movie1 = @studio1.movies.create!(title: 'Maverick', creation_year: 2022, genre: 'action')
@movie2 = @studio1.movies.create!(title: 'TopGun', creation_year: 1984, genre: 'action')
@movie3 = @studio2.movies.create!(title: 'Frozen', creation_year: 2014, genre: 'animation')
@movie4 = @studio3.movies.create!(title: 'Happy Gilmore', creation_year: 1999, genre: 'comedy')
@movie5 = @studio4.movies.create!(title: 'Everything Everywhere All At Once', creation_year: 2022, genre: 'meta')

@actor1 = @movie1.actors.create!(name: 'Tom Cruise', age: 51)
@actor2 = @movie1.actors.create!(name: 'Jennifer Connelly', age: 49)
@actor3 = @movie1.actors.create!(name: 'Miles Teller', age: 29)
@actor4 = @movie1.actors.create!(name: 'Val Kilmer', age: 58)
@actor5 = Actor.create!(name: 'Jon Hamm', age: 45)
