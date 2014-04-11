class DivesiteCategory < ActiveRecord::Base

  validates :divesite, presence: true, on: :update
  validates :category, presence: true, on: :update
  validates_uniqueness_of :divesite, scope: :category

  belongs_to :category
  belongs_to :divesite
end
