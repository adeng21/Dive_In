class Divesite < ActiveRecord::Base

  validates :name, presence: true
  validates :country, presence: true
  validates :description, presence: true
  validates :rating, presence: true, inclusion: {:in => 1..5}
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :reviews, dependent: :destroy, inverse_of: :divesite
  has_many :divesite_categories
  has_many :categories, through: :divesite_categories
  has_many :divesite_months
  has_many :months, through: :divesite_months
end
