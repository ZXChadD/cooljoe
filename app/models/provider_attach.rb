class ProviderAttach < ApplicationRecord

  mount_uploader :image, ProviderAttachUploader
  belongs_to :provider

end
