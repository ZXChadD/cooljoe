class Joblisting < ApplicationRecord

  belongs_to :user
  belongs_to :provider
  has_many :job_attaches, dependent: :destroy
  has_one :invoice

  before_save do
    # self.type.gsub!(/[\[\]\"]/, "") if attribute_present?("type")
    self.type.gsub!(/[\[\]\"]/, "") if attribute_present?("fixture")
  end

end
