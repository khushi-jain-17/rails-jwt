class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy
  validates :name, presence: true
  validates :rating, presence: true

  def update_average_rating
    self.rating = reviews.average(:star)&.round(1)
    save
  end

end
