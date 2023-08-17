require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before :each do
   @user= FactoryBot.create(:user, name: "khushi",username: "khushijain", role: "user", email: "khushi@gmail.com", password: "password",password_confirmation: "password") 
   @category= FactoryBot.create(:category, name: 'hollywood')
   @token = JsonWebToken.encode(user_id: @user.id)
   allow(controller).to receive(:authorize_request)
   
  end

  describe "GET /index" do
    before { get "/category", headers: { Authorization: @token } }
    it 'returns all categories' do
      expect(json.size) == (2)
    end

     it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

     it 'returns category' do
      expect(json).not_to be_empty
    end
  end

    describe 'GET /category/:id' do
    before { get "/category/#{@category.id}", headers: { Authorization: @token } }
    context 'when the record exists' do

      it 'returns the category' do
        expect(json).not_to be_empty
        
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
