class Invoice < ApplicationRecord
  belongs_to :provider
  belongs_to :job
end
