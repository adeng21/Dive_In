class Divesite < ActiveRecord::Base

  validates :name, presence: true
  validates :country, presence: true
  validates :description, presence: true
  validates :rating, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

end
