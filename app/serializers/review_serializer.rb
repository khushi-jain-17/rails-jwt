class ReviewSerializer < ActiveModel::Serializer
  attributes :star, :body, :user_id, :movie_id
  belongs_to :user
  belongs_to :movie 
end
