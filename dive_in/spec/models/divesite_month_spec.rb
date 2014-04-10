require 'spec_helper'

describe DivesiteMonth do
  it{should validate_presence_of(:divesite_id)}
  it{should validate_presence_of(:month_id)}
  # it{should validate_uniquess_of{:divesite_id}.scoped_to(:month_id)} need to fix this
  it{should belong_to(:divesite)}
  it{should belong_to(:month)}
end
