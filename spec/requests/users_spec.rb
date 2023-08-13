require 'rails_helper'

RSpec.describe "Users", type: :request do

   before :each do
    @user = FactoryBot.create(:user, name: "khushi", username: "khushijain", role: "user", email: "k@gmail.com", password: "password",password_confirmation: "password")
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
    #@username = @user.username
  end

  describe "GET /users" do
    before { get '/users', headers: { Authorization: @token } }

    it 'returns users' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
   end

   describe 'GET /users/:username' do
    before { get "/users/#{@user.id}", headers: { Authorization: @token } }
    context 'when the record exists' do

      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['username']) == (@username)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
   end

    describe 'POST #create' do
    it 'creates a new user' do
      post '/users', params: { name: "Ankit", username: "ankit", role: "user", email: "ankit@gmail.com", password: "password", password_confirmation: "password" }, headers: { Authorization: @token }
      expect(response).to have_http_status(:created)
    end
    end

  describe 'PATCH #update' do
    it 'updates an existing user' do
      updated_name = 'Updated Name'
      updated_email ='updated@example.com'
      patch "/users/#{@user.id}", params: { name: updated_name, email: updated_email }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
      expect(json['name'])==(updated_name)
      expect(json['email'])==(updated_email)
    end
  end

  describe 'DELETE #delete' do
    before { delete "/users/#{@user.id}", headers: { Authorization: @token } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end 



end


