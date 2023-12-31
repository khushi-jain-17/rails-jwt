require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  
  before :each do
    @user= FactoryBot.create(:user, name: "khushi",username: "khuhijain", role: "user", email: "khushi@gmail.com", password: "password",password_confirmation: "password")
    @category = FactoryBot.create(:category, name: "hollywood")
    @movie= FactoryBot.create(:movie, name: "titanic",rating: 3, user_id: @user.id, category_id: @category.id, description: nil,director: nil)
    @review= FactoryBot.create(:review, star: 4, body: "Great", user_id: @user.id, movie_id: @movie.id)
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe "GET /index" do
    before { get "/movie/#{@movie.id}/review/#{@review.id}", headers: { Authorization: @token } }
    it 'returns all reviews' do
      expect(json.size) == (6)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
     it 'returns review' do
      expect(json).not_to be_empty
    end

  end

  describe 'GET /review/:id' do
    before { get "/movie/#{@movie.id}/review/#{@review.id}", headers: { Authorization: @token } }
    context 'when the record exists' do

      it 'returns the review' do
        expect(json).not_to be_empty
        expect(json['star']) == (@star)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

   describe 'POST /create' do
    it "creates a new review" do 
    
      review_params = {
        #   movie: {
        #   category_id: @category.id,
        #   user_id: @user.id,     
        #   rating: 2,
        #   name: "danger"
        # },
        review: {
        user_id: @user.id,
        movie_id: @movie.id,
        star: 5,
        body: "Nice"
        }
      }
      post "/movie/#{@movie.id}/review", params: review_params, headers: { Authorization: @token }
      expect(response).to have_http_status(:created)
    end
  end

  #  describe 'POST /create' do
  #   it "creates a new review" do 
  
  #     r_params = {
  #       user: {
  #         name: 'amrita',
  #         username: 'amrita',
  #         email: 'a@gmail.com',
  #         password: 'password'
  #       },
  #       category: {
  #         name: "hollywood"
  #       },
  #       movie: {
  #         category_id: @category.id,
  #         user_id: @user.id,
  #         name: "inception",
  #         rating: 3
  #       },
  #       review: { 
  #       user_id: @user.id,
  #       movie_id: @movie.id,
  #       star: 3,
  #       body: "wow"
  #     }
  #   }
  #     post "/movie/#{@movie.id}/review" , params: r_params, headers: { Authorization: @token }
  #     expect(response).to have_http_status(:created)
  #   end
  # end

    describe 'PATCH /update' do
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


