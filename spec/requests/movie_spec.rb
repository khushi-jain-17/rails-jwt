require 'rails_helper'

RSpec.describe "Movies", type: :request do

  before :each do
    @user = FactoryBot.create(:user, name: "khushi", username: "khushijain", role: "user", email: "k@gmail.com", password: "password",password_confirmation: "password") 
    @category = FactoryBot.create(:category, name: "hollywood")
    @movie = FactoryBot.create(:movie, name: "avenger",rating: 3,description: "sample",director: "dir",user_id: @user.id,category_id: @category.id)
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe "GET /index" do
    before { get '/movie', headers: { Authorization: @token } }

    it 'returns all movies' do
      expect(json.size) == (2)
    end

     it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

     it 'returns movies' do
      expect(json).not_to be_empty
    end

  end

  describe 'POST /create' do
    it "creates a new movie" do 
      movie_params = {
        user_id: @user.id,
        category_id: @category.id,
        name: 'titanic',
        rating: 4
      }
      post '/movie', params: movie_params, headers: { Authorization: @token }
      expect(response).to have_http_status(:created)
    end
  end

    describe 'PATCH #update' do
    it 'updates an existing movie' do
      updated_name = 'Updated Name'
      updated_rating = 4
      patch "/users/#{@movie.id}", params: { name: updated_name, rating: updated_rating }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
      expect(json['name'])==(updated_name)
      expect(json['rating'])==(updated_rating)
    end
  end
 
  describe "DELETE /destroy" do
    before { delete "/movie/#{@movie.id}", headers: { Authorization: @token } }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end 

end