class Schedule < ApplicationRecord
  belongs_to :user
  has_one :appointment, dependent: :destroy
end
