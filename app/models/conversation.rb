class Conversation < ApplicationRecord

  belongs_to :user
  belongs_to :provider

  validates :user_id, uniqueness: { scope: :provider_id }

  has_many :messages, dependent: :destroy

end
