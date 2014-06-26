class MoviesController < ApplicationController
  def index
  	@movies = Movie.search_for(params[:q])
  end

  def show
  	@movie = Movie.find_by_id(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to @movie
  	else
  		render 'new'
  	end
  end


  private
  	def movie_params
  		params.require('movie').permit(:title, :description, :year_released)
  	end


end



