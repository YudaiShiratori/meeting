class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 3 }
  has_secure_password
   
  mount_uploader :image, ImageUploader
  
  # 面接官
   has_one :schedule, dependent: :destroy
   has_many :schedule_eachschedules, through: :schedule, source: :eachschedule
   
  # 面接者
   has_many :appointments, dependent: :destroy
   # has_many :match_eachschedules, through: :appointment, source: :eachschedule
   
end
