class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :provider

  validates_uniqueness_of :user_id, :scope => :provider_id
end
