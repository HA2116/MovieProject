class MoviesController < ApplicationController
  def index
    @movies = Movie.approved.page(params[:page])
  end
end
