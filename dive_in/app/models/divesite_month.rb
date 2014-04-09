class DivesiteMonth < ActiveRecord::Base

  validates :divesite_id, presence: true
  validates :month_id, presence: true

  belongs_to :divesite
  belongs_to :month
end
