class MoviesController < ApplicationController
  def index
	@movies = Movie.all 
  end
  def show
  	@movie = Movie.find(params[:id])
  	@shows = @movie.shows.order('start_time desc').includes(:theater).paginate(:page => params[:page], :per_page => 5)

  end
end
