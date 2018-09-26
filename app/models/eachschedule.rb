class Eachschedule < ApplicationRecord
  belongs_to :schedule
  has_one :appointment, dependent: :destroy
  has_many :scheduled_users
end
