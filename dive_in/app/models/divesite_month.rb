class DivesiteMonth < ActiveRecord::Base

  validates :divesite_id, presence: true
  validates :month_id, presence: true
  validates_uniqueness_of :divesite_id, scope: :month_id

  belongs_to :divesite
  belongs_to :month
end
