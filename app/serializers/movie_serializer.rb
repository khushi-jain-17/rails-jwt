class MovieSerializer < ActiveModel::Serializer
  attributes :movie
  def movie
    {
      name: object.name, 
      rating: object.rating, 
      description: object.description, 
      director: object.director, 
      released_on: object.released_on
    }
  end
  belongs_to :user, serializer: UserSerializer
  belongs_to :category, serializer: CategorySerializer
  has_many :reviews, serializer: ReviewSerializer
end



