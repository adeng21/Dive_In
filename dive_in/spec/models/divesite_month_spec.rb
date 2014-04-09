require 'spec_helper'

describe DivesiteMonth do
  it{should validate_presence_of(:divesite_id)}
  it{should validate_presence_of(:month_id)}
  it{should belong_to(:divesite)}
  it{should belong_to(:month)}
end
