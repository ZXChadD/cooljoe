class ProviderAttach < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :provider
end
