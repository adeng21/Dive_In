require 'spec_helper'

describe Category do
  it{should validate_presence_of(:name)}
  it{should ensure_inclusion_of(:name).in_array(%w(Wrecks/Artifacts Caves Drift Walls Whales\ &\ Sharks Macro/Corals Manta\ Rays Night Turtles Schools\ of\ Fish))}
  it{should validate_uniqueness_of(:name)}
  it{should have_many(:divesites)}
  it{should have_many(:divesite_categories)}
end
