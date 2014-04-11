class Medium < ActiveRecord::Base
  validates :divesite, presence: true
  belongs_to :divesite

  mount_uploader :image, ImageUploader
end
