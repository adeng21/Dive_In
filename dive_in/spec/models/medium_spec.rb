require 'spec_helper'

describe Medium do
  it{should belong_to(:divesite)}
  it{should validate_presence_of(:divesite_id)}
end
