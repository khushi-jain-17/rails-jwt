class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :movies, serializer: MovieSerializer
end
