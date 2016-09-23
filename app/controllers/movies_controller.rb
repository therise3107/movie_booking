class MoviesController < ApplicationController

  def index
	@movies = Movie.all 
  end

  def show
  	@movie = Movie.find(params[:id])
    @theaters = @movie.theaters.includes(:shows).uniq
  	@shows = @movie.shows.filter(filterable_params).includes(:theater).paginate(:page => params[:page], :per_page => (params[:per_page]|| 5)).order('start_time desc')
  end

  private 

  def filterable_params
  	params.slice(:theater_name)
  end

end
