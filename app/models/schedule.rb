class Schedule < ApplicationRecord
  belongs_to :user
  has_one :apointment, dependent: :destroy
end
