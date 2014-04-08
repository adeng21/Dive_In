require 'spec_helper'

describe User do
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}
  it {should have_many(:reviews).dependent(:nullify)}
end

describe 'admin checks' do
  it 'is not an admin if the role is not admin' do
    user = FactoryGirl.build(:user)
    expect(user.is_admin?).to_not be_true
  end

  it 'is an admin if the role is admin' do
    user = FactoryGirl.build(:user, role: 'admin')
    expect(user.is_admin?).to be_true
  end
end
