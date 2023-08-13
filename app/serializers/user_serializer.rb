class UserSerializer < ActiveModel::Serializer
  attributes :user

  def user
    {
      id: object.id,
      username: object.username,
      name: object.name, 
      email: object.email, 
      password: object.password,
      role: object.role
    }
  end
    
  has_many :reviews, serializer: ReviewSerializer
  has_many :movies, serializer: MovieSerializer
  
end


