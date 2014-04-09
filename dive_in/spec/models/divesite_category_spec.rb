require 'spec_helper'

describe DivesiteCategory do
  it{should validate_presence_of(:divesite_id)}
  it{should validate_presence_of(:category_id)}
  it{should belong_to(:category)}
  it{should belong_to(:divesite)}
end
