require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  
  before :each do
    @user= FactoryBot.create(:user, name: "khushi",username: "khushijain", role: "user", email: "k@gmail.com", password: "password",password_confirmation: "password")
    @category = FactoryBot.create(:category, name: "hollywood")
    @movie= FactoryBot.create(:movie, name: "avenger",rating: 3,user_id: @user.id, category_id: @category.id)
    @review= FactoryBot.create(:review, star: 4, user_id: @user.id, movie_id: @movie.id)
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe "GET /index" do
    before { get "/movie/#{@movie.id}/review", headers: { Authorization: @token } }
    it 'returns all reviews' do
      expect(json.size) == (3)
    end
     it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

   describe 'POST /create' do
    it "creates a new movie_review" do 
      review_params = {
        user_id: @user.id,
        movie_id: @movie.id,
        star: 3
      }
      post "/movie/#{@movie.id}/review", params: review_params, headers: { Authorization: @token }
      expect(response).to have_http_status(:created)
    end
  end


  describe "DELETE /destroy" do
    before { delete "/movie/2/review", headers: { Authorization: @token } }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end 
end


