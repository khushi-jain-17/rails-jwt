class MovieController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_movie, only: [:show, :edit, :destroy, :update]

  def index
    @movies=Movie.all
    render json: @movies, status: :ok
  end

  def show
  	render json: @movie, status: :ok
  end

  def create
  	@movie=Movie.new(movie_params)
  	if @movie.save
  		render json: @movie, status: :created
  	else
  		render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
  	end
  end

  private
    def movie_params
      params.permit(:name, :rating, :description, :director, :released_on, :category_id)
    end

    def set_movie
      @movie= Movie.find(params[:id])
    end	
end
