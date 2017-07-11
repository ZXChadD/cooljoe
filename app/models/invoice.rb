class Invoice < ApplicationRecord

  belongs_to :provider
  belongs_to :joblisting

  enum status: {
    'Awaiting Payment': 1,
    'Payment Received': 2,
    'Payment Released': 3,
  }


end
