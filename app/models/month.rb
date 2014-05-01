class Month < ActiveRecord::Base
  validates :name, presence: true, inclusion: {in: (%w(January February March April May June July August September October November December))}, uniqueness: true

  has_many :divesite_months
  has_many :divesites, through: :divesite_months
end
