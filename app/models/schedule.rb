class Schedule < ApplicationRecord
  belongs_to :user
  has_many :myschedule
  has_one :appointment, dependent: :destroy
  accepts_nested_attributes_for :eachschedules, allow_destroy: true

end
