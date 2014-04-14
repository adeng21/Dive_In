require 'spec_helper'

feature 'add photos to an existing divesite ', %Q{
  As an admin
  I want to be able to add photos to an existing divesite
  So that I can provide visual representation of the divesites to my users
} do

  #ACCEPTANCE CRITERIA
  #An admin can optionally add photos to an existing divesite
  #An admin can delete photos of an existing divesite
  #If an admin supplies a photo, it must be a jpg, png, or gif
  #If an admin supplies a photo, it cannot exceed 5MB

  before :each do
    admin = FactoryGirl.create(:user, role: 'admin')
    @divesite = FactoryGirl.create(:divesite)
    sign_in_as(admin)
    click_on 'Admin Section'
    click_on 'List of Existing Divesites'
    click_on @divesite.name
    attach_file 'medium_image', Rails.root.join('spec/file_fixtures/blue_hole.jpg')
    click_on 'Add Image'
  end

  scenario 'an admin adds a valid photo to an existing divesite' do

    expect(page).to have_content("Image Successfully Added!")
    expect(@divesite.media.count).to eql(1)
  end

  scenario 'an admin can delete an existing photo from a divesite' do
    click_on 'Delete Image'

    expect(@divesite.media.count).to eql(0)
  end
end
