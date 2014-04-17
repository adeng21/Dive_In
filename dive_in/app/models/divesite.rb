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

  def total_review_ratings
    ratings = []
    reviews.all.each do |review|
      ratings << review[:rating]
    end
    ratings
  end

  def average_review_rating
    (total_review_ratings.inject{|sum, review| sum + review}/reviews.all.count).to_f
  end

  def overall_rating
    if reviews.count == 0
      rating.to_f
    elsif reviews.count <= 10
      (rating.to_f * 0.5) + (average_review_rating * 0.5)
    else
      average_review_rating
    end
  end

  def self.search(params)
    months = params[:months].map{|month| month.to_i}
    categories = params[:categories].map{|category| category.to_i}

    self.includes([:months, :categories]).where("months.id IN (?) OR categories.id IN (?)", months, categories)

  end
end
