require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  
  before :each do
    @user= FactoryBot.create(:user, name: "khushi",username: "khushijain", role: "user", email: "k@gmail.com", password: "password",password_confirmation: "password")
    @category = FactoryBot.create(:category, name: "hollywood")
    @movie= FactoryBot.create(:movie, name: "avenger",rating: 3, user_id: @user.id, category_id: @category.id, description: nil,director: nil)
    @review= FactoryBot.create(:review, star: 4, user_id: @user.id, movie_id: @movie.id)
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe "GET /index" do
    before { get "/movie/#{@movie.id}/review/#{@review.id}", headers: { Authorization: @token } }
    it 'returns all reviews' do
      expect(json.size) == (5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
     it 'returns review' do
      expect(json).not_to be_empty
    end

  end

   describe 'POST /create' do
    it "creates a new movie review" do 
  
      r_params = {
        review: {
        user_id: @user.id,
        movie_id: @movie.id,
        star: 3,
        body: "wow"
      }
    }
      post "/movie/#{@movie.id}/review" , params: r_params, headers: { Authorization: @token }
      expect(response).to have_http_status(201)
    end
  end

    describe 'PATCH #update' do
    it 'updates an existing movie' do
      updated_star = 1
      patch "/movie/#{@movie.id}/review/#{@review.id}", params: { star: updated_star }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
      expect(json['star'])==(updated_star)
    end
    end


  describe "DELETE /destroy" do
    before { delete "/movie/#{@movie.id}/review/#{@review.id}", headers: { Authorization: @token } }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end 

end


