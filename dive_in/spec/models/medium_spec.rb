require 'spec_helper'

describe Medium do
  it{should belong_to(:divesite)}
  it{should belong_to(:category)}
end
