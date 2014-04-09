require 'spec_helper'

feature 'divesites are grouped by months that represent the best times to go', %Q{
  As a visitor
  I want to see the best times of the year to go to each divesite
  So that I can pick the right time to go
} do

  #ACCEPTANCE CRITERIA
  #Each divesite page lists the best months of the year to dive, with a minimum of one month
  #The home page lists each month of the year and links to divesites categorized under that month
  #User does not have to be signed in to view this functionality

  before :each do
    @divesite = FactoryGirl.create(:divesite)
    @month = FactoryGirl.create(:month)
    @divesite.months << @month
  end

  scenario "visitor sees the best months to go to a divesite on the site's page" do
    visit divesite_path(@divesite)

    expect(page).to have_content(@month.name)
  end

  scenario "visitor can view all the divesites listed under a certain month from the homepage" do
    visit root_path
    click_on @month.name

    expect(page).to have_content(@divesite.name)
  end
end
