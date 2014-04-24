class DivesiteCategory < ActiveRecord::Base

  validates :divesite, presence: true, on: :update
  validates :category, presence: true, on: :update
  validates :divesite_id, uniqueness: {scope: :category_id}

  belongs_to :category
  belongs_to :divesite
end
