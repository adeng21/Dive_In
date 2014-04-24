require 'spec_helper'

describe DivesiteMonth do
  let!(:divesite_month) {FactoryGirl.create(:divesite_month)}
  it{should validate_uniqueness_of(:divesite_id).scoped_to(:month_id)}
  it{should belong_to(:divesite)}
  it{should belong_to(:month)}
end
