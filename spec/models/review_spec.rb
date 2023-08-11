

# RSpec.describe Review, type: :model do
# 	user=User.create(name:'khushi',email:'k@gmail.com',password:'password')
# 	movie=Movie.create(name:'avenger',rating: 3)
# 	review=Review.create(star: 4,user:user,movie: movie)
#   # let(:user) { create(:user) }   
#   # let(:movie) { create(:movie) }
#   #movie = FactoryBot.create(movies)
#   describe 'validations' do
#     it 'validates uniqueness of user_id scoped to movie_id' do
#     	byebug
#       #review = create(:review, user: user, movie: movie) 

#       #new_review = build(:review, user: user, movie: movie)

#       expect(review).to be_valid
#       #expect(new_review.errors[:user_id]).to include('has already been taken')
#     end
#   end
# end

# Rspec.describe Review, type: :model do
#   describe "review model testing" do
#   	let(:user) {create(:user)}
#   	let(:movie) {create(:movie)}
#   	let(:review) {create(:review)}
#     it { should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }
#   	# it "validates" do 
#   	#   expect(review).to be_valid
#   	# end
#   end
# end

# spec/models/review_spec.rb
require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "review model testing" do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }
    let(:review) { create(:review, user: user, movie: movie) } # Create a review associated with the user and movie

    it { should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }

    # You can also add additional tests if needed
    # it "is valid with valid attributes" do
    #   expect(review).to be_valid
    # end
  end
end
