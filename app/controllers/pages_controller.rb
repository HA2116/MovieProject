class PagesController < ApplicationController
  def dashboard
    @latest_movies = Movie.latest.first(3)
    @featured_movies = Movie.featured.first(3)
    @top_movies = Movie.top.first(3)
  end
end
