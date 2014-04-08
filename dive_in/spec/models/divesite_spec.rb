require 'spec_helper'

describe Divesite do
  it{should validate_presence_of(:name)}
  it{should validate_presence_of(:country)}
  it{should validate_presence_of(:description)}
  it{should validate_presence_of(:rating)}
  it{should validate_presence_of(:latitude)}
  it{should validate_presence_of(:longitude)}
  it{should ensure_inclusion_of(:rating).in_array(%w[1 5])}
  it{should have_many(:reviews).dependent(:destroy)}
end


