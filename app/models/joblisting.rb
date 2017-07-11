class Joblisting < ApplicationRecord

  belongs_to :user
  # belongs_to :provider
  has_many :job_attaches, dependent: :destroy
  accepts_nested_attributes_for :job_attaches, reject_if: :all_blank, allow_destroy: true
  has_one :invoice

  before_save do
    issue.gsub!(/[\[\]\"]/, '') if attribute_present?('issue')
    fixture.gsub!(/[\[\]\"]/, '') if attribute_present?('fixture')
  end

  enum status: {
    'created':    1,
    'pending':    2,
    'booked':     3,
    'completed':  4,
    'cancel':     5
  }

end
