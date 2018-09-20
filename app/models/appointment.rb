class Appointment < ApplicationRecord
  belongs_to :schedule
  has_one :user
end