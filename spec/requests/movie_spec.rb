require 'rails_helper'

RSpec.describe "Movies", type: :request do
    before :each do
    @movie = FactoryBot.create(:movie, name: "titanic",rating: 4,director: "sample",description:"sdescription")
    @token = JsonWebToken.encode(movie_id: @movie.id)
    allow(controller).to receive(:authorize_request)
    @name = @movie.name
  end

  describe "GET /movie" do
    before { get '/movie', headers: { Authorization: @token } }

    it 'returns users' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
   end

  
end

