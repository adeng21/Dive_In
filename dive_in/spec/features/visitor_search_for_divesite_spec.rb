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
end

scenario 'visitor inputs preferences that match an existing divesite' do
  visit root_path
  click_on "Search for the Perfect Divesite"
  select @divesite.categories.first, from: "Category"
  select @divesite.months.first, from: "Month"
  select @divesite.country, from: "Country"
  select "Search for Divesite"

  expect(page).to have_content(@divesite.name)
  expect(page).to have_content("1 divesite found matching your preferences")
end


scenario 'visitor inputs preferences that do not match an existing divesite'




end
