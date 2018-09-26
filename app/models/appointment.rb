class Appointment < ApplicationRecord
  belongs_to :eachschedule
  belongs_to :user
end