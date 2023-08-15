class ReviewController < ApplicationController
  skip_before_action :authenticate_request, only: [:create,:update, :destroy]
  before_action :movie_object, only: [:create, :show, :destroy, :update]
  before_action :movie_review, only: [:index, :show, :update, :destroy]

  def index
    @reviews=Review.all
    render json: @reviews, status: :ok, each_serializer: ReviewSerializer
  end

  def show
  	render json: @review, status: :ok, each_serializer: ReviewSerializer
  end

  def create
    
  	@review=@movie.reviews.new(review_params)
  	if @review.save
  	  render json: @review, status: :created
  	else
      render json: @review.errors, status: :unprocessable_entity
  	end
  end

  def update
    if @review.update(review_params)
        render json: @review, notice: "updated"
    else
        render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head :no_content
  end

   private
   
   def movie_object
   	@movie= Movie.find(params[:movie_id])
   end
   
   def movie_review
    @review = @movie.reviews.find(params[:id])
   end

   # def movie_review
   #  @reviews= @movie.reviews
   # end

   def review_params
    params.permit(:star, :body, :user_id, :movie_id)
   end

end


