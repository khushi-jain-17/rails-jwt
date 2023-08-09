class MovieController < ApplicationController
  skip_before_action :authenticate_request, only: [:create,:update, :destroy]
  before_action :set_movie, only: [:show, :update, :destroy]

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
      render json: @movie.errors, status: :unprocessable_entity
  	end
  end

  def update
      if @movie.update(movie_params)
        render json: @movie, status: :ok
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @movie.destroy
    render json: { message: 'movie successfully deleted'}, status: :ok  
  end

  private
    def movie_params
      params.require(:movie).permit(:name, :rating, :description, :director, :released_on, :category_id, :user_id)
    end

    def set_movie
      @movie= Movie.find(params[:id])
    end	
end
