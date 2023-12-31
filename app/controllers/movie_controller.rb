class MovieController < ApplicationController
  skip_before_action :authenticate_request, only: [:create,:update, :destroy]
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    @movies=Movie.all
    render json: @movies, status: :ok, each_serializer: MovieSerializer
  end

  def show
  	render json: @movie, status: :ok, each_serializer: MovieSerializer
  end

  def create
  	@movie=Movie.new(movie_params)
  	if @movie.save
  		render json: @movie, status: :created
  	else
      render json: @movie.errors, status: :unproscessable_entity
  	end
  end

  def update
      if @movie.update(movie_params)
        render json: @movie, notice: "Successfully Updated"
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @movie.destroy
    head :no_content
  end

  def about
  end    

  private
    def movie_params
      params.permit(:name, :rating, :description, :director, :released_on, :category_id, :user_id)
    end

    def set_movie
      @movie= Movie.find(params[:id])
    end	
    
end
