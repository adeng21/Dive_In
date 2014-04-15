class Medium < ActiveRecord::Base
  belongs_to :divesite

  mount_uploader :image, ImageUploader
end
