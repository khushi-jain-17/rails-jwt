class MovieSerializer < ActiveModel::Serializer
	
  attributes :name, :rating, :description, :director, :released_on, :user_id, :category_id
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy

end
