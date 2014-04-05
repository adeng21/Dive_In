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

  before :each do
    user = FactoryGirl.create(:user, role: 'admin')
    sign_in_as(user)
    click_on 'Admin Section'
  end

  scenario 'an admin adds a new divesite' do

    click_on 'Add New Divesite'
    fill_in 'Name', with: 'Barracuda Point'
    fill_in 'Region', with: "Sipadan Island, Sabah"
    select 'Malaysia', from: 'Country'
    fill_in 'Latitude', with: '4.1147'
    fill_in 'Longitude', with: '118.6288'
    fill_in 'Description', with: 'Pretty much the best dive site ever.'
    fill_in 'Surrounding area', with: 'Other dives on Sipadan island are amazing as well'
    select '5', from: 'Rating'
    fill_in 'Water temperature', with: '30-32 C'
    fill_in 'Visibility', with: '80-90 feet'
    click_on 'Create Divesite'


    expect(page).to have_content('New Divesite Successfully Created!')
    expect(current_path).to eql(admin_homes_path)
  end

  scenario 'an admin removes multiple existing divesites' do
    divesite = FactoryGirl.create(:divesite)
    divesite2 = FactoryGirl.create(:divesite, name: 'Sipadan')
    click_on 'List of Existing Divesites'
    find(:css, "#site_id_[value='#{divesite.id}']").set(true)
    find(:css, "#site_id_[value='#{divesite2.id}']").set(true)
    click_on 'Delete Selected Divesites'

    expect(page).to_not have_content(divesite.name, divesite2.name)
    expect(page).to have_content("Divesite(s) Successfully Deleted")
  end

  scenario 'an admin deletes a single existing divesite' do
    divesite = FactoryGirl.create(:divesite)
    click_on 'List of Existing Divesites'
    click_on "#{divesite.name}"
    click_on 'Remove Divesite'

    expect(page).to have_content("Divesite Successfully Removed")
    expect(current_path).to eql(admin_divesites_path)
    expect(page).to_not have_content("#{divesite.name}")
  end

  scenario 'ad admin edits an existing divesite' do
    divesite = FactoryGirl.create(:divesite)
    click_on 'List of Existing Divesites'
    click_on "#{divesite.name}"
    click_on "Edit Information"
    fill_in "Region", with: "San Pedro"
    click_on "Update Divesite"

    expect(page).to have_content("Divesite Successfully Updated")
    expect(page).to have_content("San Pedro")

  end

end
