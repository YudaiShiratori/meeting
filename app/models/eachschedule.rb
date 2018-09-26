class Eachschedule < ApplicationRecord
  belongs_to :schedule
  has_many :appointments, dependent: :destroy
end