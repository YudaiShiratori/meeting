class Schedule < ApplicationRecord
  belongs_to :user
  # has_many :myschedules
  has_many :eachschedules
  belongs_to :eachschedule
  accepts_nested_attributes_for :eachschedules, allow_destroy: true
  
  validates :getu_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :getu_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :ka_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :ka_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :sui_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :sui_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :moku_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :moku_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :kin_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :kin_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :doyou_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :doyou_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
  validates :niti_start, :numericality => { :greater_than => 6, :less_than => 23, allow_blank: true}
  validates :niti_end, :numericality => { :greater_than => 7, :less_than => 24, allow_blank: true}
end