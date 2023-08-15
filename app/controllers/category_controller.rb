class CategoryController < ApplicationController
  skip_before_action :authenticate_request

  def index
  	@categories = Category.all
  	render json: @categories, status: :ok, each_serializer: CategorySerializer
  end

end
