class Medium < ActiveRecord::Base
  belongs_to :divesite
  belongs_to :category

  mount_uploader :image, ImageUploader
end
