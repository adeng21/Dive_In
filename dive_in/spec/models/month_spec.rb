require 'spec_helper'

describe Month do
  it{should validate_presence_of(:name)}
  it{should validate_uniqueness_of(:name)}
  it{should ensure_inclusion_of(:name).in_array(%w(January February March April May June July August September October November December))}
  it{should have_many(:divesite_months)}
  it{should have_many(:divesites)}
end
