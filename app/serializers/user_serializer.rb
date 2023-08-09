class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :email, :password, :name, :role
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy
  
end
