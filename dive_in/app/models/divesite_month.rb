class DivesiteMonth < ActiveRecord::Base

  validates :divesite, presence: true, on: :update
  validates :month, presence: true, on: :update
  validates :divesite_id, uniqueness: {scope: :month_id}
  belongs_to :divesite
  belongs_to :month
end
