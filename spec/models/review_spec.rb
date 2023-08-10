require 'rails_helper'

RSpec.describe Review, type: :model do
	user=User.create(name:'khushi',email:'k@gmail.com',password:'password')
	movie=Movie.create(name:'avenger',rating: 3)
	review=Review.create(star: 4,user:user,movie: movie)
  # let(:user) { create(:user) }   
  # let(:movie) { create(:movie) }
  #movie = FactoryBot.create(movies)

  describe 'validations' do
    it 'validates uniqueness of user_id scoped to movie_id' do
    	byebug
      #review = create(:review, user: user, movie: movie) 

      #new_review = build(:review, user: user, movie: movie)

      expect(new_review).not_to be_valid
      expect(new_review.errors[:user_id]).to include('has already been taken')
    end
  end
end

