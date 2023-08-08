class CategoryController < ApplicationController
  def index
  	@categories = Category.all
  	render json: @categories, status: :ok
  end
end
