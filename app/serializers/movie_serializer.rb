class MovieSerializer < ActiveModel::Serializer
	
  attributes :description, :director, :released_on, :user_id, :category_id, :movie
  
  def movie
    {
      id: object.movie.id,
      name: object.movie.name,
      rating: object.rating
    }
  end

  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy

end
