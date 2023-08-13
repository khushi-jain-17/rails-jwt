#require 'avatar_uploader' 
class User < ApplicationRecord
  require "securerandom"	
  has_secure_password 
  validates :email, presence: true
  validates :username, presence: true
  #validates :password, presence: true
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy
  enum role: [:user, :admin]          	
end


