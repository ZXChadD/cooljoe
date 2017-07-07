class Invoice < ApplicationRecord
  belongs_to :provider
  belongs_to :joblisting
end
