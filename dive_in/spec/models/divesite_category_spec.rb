require 'spec_helper'

describe DivesiteCategory do
  let!(:divesite_category) {FactoryGirl.create(:divesite_category)}
  it{should validate_uniqueness_of(:divesite_id).scoped_to(:category_id)}
  it{should belong_to(:category)}
  it{should belong_to(:divesite)}
end
