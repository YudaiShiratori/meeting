class Schedule < ApplicationRecord
  belongs_to :user
  has_many :eachschedules
  accepts_nested_attributes_for :eachschedules, allow_destroy: true
  
  validates :schedule_make, presence: true
  
  validates :getu_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :getu_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :getu_start}
  validates :ka_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :ka_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :ka_start}
  validates :sui_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :sui_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :sui_start}
  validates :moku_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :moku_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :moku_start}
  validates :kin_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :kin_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :kin_start}
  validates :doyou_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :doyou_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :doyou_start}
  validates :niti_start, :numericality => { :greater_than => 5, :less_than => 24, allow_blank: true}
  validates :niti_end, :numericality => { :greater_than => 6, :less_than => 25, allow_blank: true, :greater_than => :niti_start}
  
  # validates :getu_start, presence: true, if: :getu_end.present?
  # validates :getu_end, presence: true, if: :getu_start.present?
  # validates :ka_start, presence: true, if: :ka_end.present?
  # validates :ka_end, presence: true, if: :ka_start.present?
  # validates :sui_start, presence: true, if: :sui_end.present?
  # validates :sui_end, presence: true, if: :sui_start.present?
  # validates :moku_start, presence: true, if: :moku_end.present?
  # validates :moku_end, presence: true, if: :moku_start.present?
  # validates :kin_start, presence: true, if: :kin_end.present?
  # validates :kin_end, presence: true, if: :kin_start.present?
  # validates :doyou_start, presence: true, if: :doyou_end.present?
  # validates :doyou_end, presence: true, if: :doyou_start.present?
  # validates :niti_start, presence: true, if: :niti_end.present?
  # validates :niti_end, presence: true, if :niti_start.present?
  
  private
  def schedule_make
    (getu_start && getu_end).presence or
    (ka_start && ka_end).presence or
    (sui_start && sui_end).presence or
    (moku_start && moku_end).presence or
    (kin_start && kin_end).presence or
    (doyou_start && doyou_end).presence or
    (niti_start && niti_end).presence 
  end
end