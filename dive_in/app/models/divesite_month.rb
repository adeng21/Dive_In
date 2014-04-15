class DivesiteMonth < ActiveRecord::Base

  validates :divesite, presence: true, on: :update
  validates :month, presence: true, on: :update
  validates_uniqueness_of :divesite, scope: :month

  belongs_to :divesite
  belongs_to :month
end
