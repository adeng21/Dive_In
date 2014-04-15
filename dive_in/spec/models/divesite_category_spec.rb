require 'spec_helper'

describe DivesiteCategory do
  # it{should validate_presence_of(:divesite_id)} need to add on update
  # it{should validate_presence_of(:category_id)} need to add on update
  # it{should validate_uniqueness_of(:divesite_id).scoped_to(:category_id)} need to fix this
  it{should belong_to(:category)}
  it{should belong_to(:divesite)}
end
