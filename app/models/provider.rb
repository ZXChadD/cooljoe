class Provider < ApplicationRecord

  mount_uploader :avatar, ProviderAvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes
  has_many :invoices
  has_many :provider_attaches
  has_many :joblistings
  has_one :schedule
  has_many :conversations
  has_many :messages
  has_many :comments

  accepts_nested_attributes_for :provider_attaches, reject_if: :all_blank, allow_destroy: true

  scope :sort_exp, -> { order('experience DESC') }

  enum experience: {
    "< 1 year":       1,
    "1 to 3 years":   2,
    "3 to 5 years":   3,
    "> 5 years":      4
  }

end
