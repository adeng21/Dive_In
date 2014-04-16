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
  has_many :media


  def overall_rating
    if reviews.count == 0
      rating
    elsif reviews.count <= 10
      (rating.to_f * 0.5) + (reviews.all.inject{|sum, review| sum + review}.to_f/reviews.all.count)
    else
      reviews.all.inject{|sum, review| sum + review}.to_f/reviews.all.count
    end
  end
end
