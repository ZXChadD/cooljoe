class Joblisting < ApplicationRecord

  belongs_to :user
  # belongs_to :provider
  has_many :job_attaches, dependent: :destroy
  accepts_nested_attributes_for :job_attaches, reject_if: :all_blank, allow_destroy: true
  has_one :invoice

  before_save do
    issue.gsub!(/[\[\]\"]/, '') if attribute_present?('issue')
    fixture.gsub!(/[\[\]\"]/, '') if attribute_present?('fixture')
    housing.gsub!(/[\[\]\"]/, '') if attribute_present?('housing')
    date.gsub!(/[\[\]\"]/, '') if attribute_present?('date')
  end

  enum status: {
    'now':        1,
    'booked':     2,
    'completed':  3,
    'cancel':     4
  }

end
