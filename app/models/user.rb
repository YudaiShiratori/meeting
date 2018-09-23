class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
   validates :password, presence: true, length: { minimum: 3 }
   has_secure_password
   
   has_many :schedules, dependent: :destroy
   has_many :myschedules, dependent: :destroy
   has_many :myschedule_schedules, through: :myschedules, source: :schedule
   
   has_many :match_users, through: :schedule, source: :user
   
   mount_uploader :image, ImageUploader
   
   accepts_nested_attributes_for :schedules, allow_destroy: true
end
