class Schedule < ApplicationRecord
  belongs_to :user
  has_many :myschedules
  has_many :eachschedules
  accepts_nested_attributes_for :eachschedules, allow_destroy: true
  
  validates :getu_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :getu_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :ka_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :ka_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :sui_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :sui_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :moku_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :moku_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :kin_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :kin_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :doyou_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :doyou_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
  validates :niti_start, :numericality => { :greater_than => 6, :less_than => 23,  :equal_to => 0}
  validates :niti_end, :numericality => { :greater_than => 7, :less_than => 24,  :equal_to => 0}
end