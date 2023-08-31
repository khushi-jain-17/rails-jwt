require 'rails_helper'

RSpec.describe Review, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie) }
  
    subject {
    described_class.new(user: user,star: 5,movie: movie)
    } 
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a star" do
       subject.star= nil
       expect(subject).to_not be_valid  
    end

    it { should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }

  end
end
