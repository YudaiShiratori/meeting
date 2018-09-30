class Appointment < ApplicationRecord
  belongs_to :eachschedule
  belongs_to :user　#対面接者
  delegate :user, to: :eachschedule#対面接官
end