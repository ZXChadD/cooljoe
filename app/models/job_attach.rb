class JobAttach < ApplicationRecord

  mount_uploader :image, JobImageUploader
  belongs_to :joblisting

end
