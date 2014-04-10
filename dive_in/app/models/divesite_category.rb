class DivesiteCategory < ActiveRecord::Base

  validates :divesite_id, presence: true
  validates :category_id, presence: true
  validates_uniqueness_of :divesite_id, scope: :category_id

  belongs_to :category
  belongs_to :divesite
end
