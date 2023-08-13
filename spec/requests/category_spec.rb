require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before :each do
   @user= FactoryBot.create(:user, name: "khushi",username: "khushijain", role: "user", email: "k@gmail.com", password: "password",password_confirmation: "password") 
   @category= FactoryBot.create(:category, name: 'hollywood')
   @token = JsonWebToken.encode(user_id: @user.id)
   allow(controller).to receive(:authorize_request)
  end

  describe "GET /index" do
    before { get "/category", headers: { Authorization: @token } }

    it 'returns all categories' do
      expect(json.size) == (1)
    end

     it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

     it 'returns category' do
      expect(json).not_to be_empty
    end

  end

end
