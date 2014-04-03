require 'spec_helper'

feature 'add/delete/edit a divesite to the site', %Q{
  As an admin
  I want to be able to add/delete/edit a divesite
  So I can properly manage the list of divesites in the database
} do

  #ACCEPTANCE CRITERIA
  #An admin can add a new divesite
  #An admin can remove an existing divesite
  #An admin can edit the attributes of an existing divesite
  #A standard user cannot add, remove, or edit a divesite

  scenario 'an admin adds a new divesite' do
    user = FactoryGirl.build(:user, role: 'admin')
    sign_in_as(user)
    click_on 'Add New Divesite'
    fill_in 'Name', with: 'Barracuda Point'
    fill_in 'Region', with: "Sipadan Island, Sabah"
    fill_in 'Country', with: 'Malaysia'
    fill_in 'Latitude', with: '4.1147'
    fill_in 'Longitude', with: '118.6288'
    fill_in 'Description', with: 'Pretty much the best dive site ever.'
    fill_in 'Surrounding Area', with: 'Other dives on Sipadan island are amazing as well'
    fill_in 'Overall Rating', with: 10
    fill_in 'Water Temperature', with: '30-32 C'
    fill_in 'Visibility', with: '80-90 feet'
    click_on 'Submit New Divesite'

    expect(page).to have_content('New Divesite Successfully Created!')


  end

  scenario 'an admin removes an existing divesite'

  scenario 'ad admin edits an existing divesite'

  scenario 'a standard user does not have access to any of the add/edit/remove functions'

end
