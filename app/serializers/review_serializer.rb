class ReviewSerializer < ActiveModel::Serializer

  attributes :star, :body, :user_id, :movie_id
  belongs_to :user, serializer: UserSerializer
  belongs_to :movie, serializer: MovieSerializer 

end
 