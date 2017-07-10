class Joblisting < ApplicationRecord

  belongs_to :user
  # belongs_to :provider
  has_many :job_attaches, dependent: :destroy
  has_one :invoice

  before_save do
    self.issue.gsub!(/[\[\]\"]/, "") if attribute_present?("issue")
    self.fixture.gsub!(/[\[\]\"]/, "") if attribute_present?("fixture")
    self.housing.gsub!(/[\[\]\"]/, "") if attribute_present?("housing")
    self.date.gsub!(/[\[\]\"]/, "") if attribute_present?("date")
  end

  enum status: {
    'now':        1,
    'booked':     2,
    'completed':  3,
    'cancel':     4
  }

end
