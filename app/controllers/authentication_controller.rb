#require Rails.root.join('app', 'controllers', 'concerns', 'json_web_token')
#require_relative '../app/controllers/concerns/json_web_token'

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
  	@user= User.find_by_email(params[:email])
  	if @user&.authenticate(params[:password])
  	  token = jwt_encode(user_id: @user.id)
  	  render json: { token: token },status: :ok	
  	else
  	  render json: { error: 'unauthorized' }, status: :unauthorized
  	end
  end	
end
