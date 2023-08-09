class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :update, :destroy]
  before_action :set_user, only: [:show, :update, :destroy]

  def index
  	@users = User.all
  	render json: @users, status: :ok
  end

  def show
  	render json: @user, status: :ok
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		render json: @user, status: :created
  	else
  		render json: @user.errors, status: :unprocessable_entity
  	end
  end

  def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @user.destroy
    render json: { message: 'user successfully deleted'}, status: :ok  
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :name, :role)
    end

    def set_user
      @user= User.find(params[:id])
    end
    
end
