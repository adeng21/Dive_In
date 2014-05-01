class Category < ActiveRecord::Base
  validates :name, presence: true, inclusion: {in: %w(Wrecks/Artifacts Caves Drift Walls Whales\ &\ Sharks Macro/Corals Manta\ Rays Night Turtles Schools\ of\ Fish)}, uniqueness: true
  has_many :divesite_categories
  has_many :divesites, through: :divesite_categories
  has_many :media
end
