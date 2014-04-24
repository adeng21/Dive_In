require 'spec_helper'

feature 'user sign out', %Q{
  As an authenticated user
  I want to sign out
  So I can exit the site properly
} do

  scenario 'user signs out' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'Sign out'

    expect(current_path).to eql(root_path)
    expect(page).to have_content("Signed out successfully")
  end
end
