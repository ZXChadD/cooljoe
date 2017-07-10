class Provider < ApplicationRecord
  mount_uploader :avatar, ProviderAvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :invoices
  has_many :provider_attaches
  has_one :schedule

  enum experience: {
    "< 1 year":       1,
    "1 to 3 years":   2,
    "3 to 5 years":   3,
    "> 5 years":      4
  }

end
