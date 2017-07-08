class Joblisting < ApplicationRecord

  belongs_to :user
  belongs_to :provider
  has_many :job_attaches, dependent: :destroy
  has_one :invoice

end
