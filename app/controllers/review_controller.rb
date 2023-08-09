class ReviewController < ApplicationController
  skip_before_action :authenticate_request, only: [:create,:update, :destroy]
  before_action :movie_object, only: [:create, :destroy, :update]
  before_action :movie_review, only: [:show, :update, :destroy]

  def index
    @reviews=Review.all
    render json: @reviews, status: :ok
  end

  def show
  	render json: @review, status: :ok
  end

  def create
  	@review=@movie.reviews.new(review_params)
  	@review.user = current_user
  	if @review.save
  	  render json: @review, status: :created
  	else
      render json: @review.errors, status: :unprocessable_entity
  	end
  end

  def update
    if @review.update(review_params)
        render json: @review, status: :ok
    else
        render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    render json: { message: 'review successfully deleted'}, status: :ok  
  end

   private
   
   def movie_object
   	@movie= Movie.find(params[:movie_id])
   end

   def movie_review
    @review= @movie.reviews.find(params[:id])
   end

   def review_params
    params.require(:review).permit(:star, :body, :user_id, :movie_id)	
   end

end
