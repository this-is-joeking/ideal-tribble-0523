class Studio < ApplicationRecord
  has_many :movies

  def actors
    Actor.joins(:actor_movies).where(actor_movies: {movie: self.movies}).distinct
  end
end
