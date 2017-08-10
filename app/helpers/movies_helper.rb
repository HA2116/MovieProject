module MoviesHelper
  def review_msg_class
    'hidden' if @movie.reviews.present?
  end
end
