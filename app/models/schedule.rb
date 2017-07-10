class Schedule < ApplicationRecord

  belongs_to :provider

  validates :date, :time, presence: true

  scope :weekends, -> {where(date: 'weekends')}
  scope :weekdays, -> {where(date: 'weekdays')}
  scope :alldays, -> {where(date: 'all')}

  before_save do
    self.date.gsub!(/[\[\]\"]/, "") if attribute_present?("date")
    self.time.gsub!(/[\[\]\"]/, "") if attribute_present?("time")
  end

end
