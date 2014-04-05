require 'spec_helper'

describe Review do
  it{should validate_presence_of(:title)}
  it{should validate_presence_of(:body)}
  it{should validate_presence_of(:date)}
  it{should validate_presence_of(:rating)}
  it{should validate_presence_of(:user_id)}
  it{should validate_presence_of(:divesite_id)}
  it{should ensure_inclusion_of(:rating).in_array(%w[1 5])}
  it{should belong_to(:user)}
  it{should belong_to(:divesite)}
end
