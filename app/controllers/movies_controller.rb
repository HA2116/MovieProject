class MoviesController < ApplicationController
  before_action :set_movie, only: :show
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Movies", :movies_path

  def index
    @movies = Movie.approved.page(params[:page])
  end

  def show
    add_breadcrumb @movie.title, movie_path
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
end
