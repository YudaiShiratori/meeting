class Schedule < ApplicationRecord
  belongs_to :user
  has_many :myschedule
  has_one :appointment, dependent: :destroy
end
