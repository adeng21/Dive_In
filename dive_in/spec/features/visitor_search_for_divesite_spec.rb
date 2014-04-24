require 'spec_helper'

feature 'visitor can search for a divesite based on his preferences', %Q{
  As an unauthenticated user
  I can search for a divesite based on certain criteria
  So I can find the perfect place to dive
} do

#Acceptance Critera
#A visitor can search for a divesite given:
#1. Category 2. Month 3. Country
#A list of divesites matching his preferences is shown, with links to the individual divesite page
#If no divesite is found matching his preferences, an error message is shown

  before :each do
    @divesite = FactoryGirl.create(:divesite)
    category = FactoryGirl.create(:category)
    month = FactoryGirl.create(:month)
    @divesite.categories << category
    @divesite.months << month
    visit root_path
    click_on "Search for the Perfect Divesite"
  end

  scenario 'visitor inputs preferences that match an existing divesite' do

    fill_in "Search By Site Name Or Country", with: @divesite.country
    click_on "Search"

    expect(page).to have_content(@divesite.name)
  end


  scenario 'visitor inputs preferences that do not match an existing divesite' do
    fill_in "Search By Site Name Or Country", with: 'Cool Divesite'
    click_on "Search"

    expect(page).to_not have_content(@divesite.name)
  end
end
