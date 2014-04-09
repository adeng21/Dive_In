class DivesiteCategory < ActiveRecord::Base

  validates :divesite_id, presence: true
  validates :category_id, presence: true

  belongs_to :category
  belongs_to :divesite
end
