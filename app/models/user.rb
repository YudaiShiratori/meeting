class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true,  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  
  has_secure_password
  validates :password, presence: true
  
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  
  has_many :following, through: :active_relationship, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
end
