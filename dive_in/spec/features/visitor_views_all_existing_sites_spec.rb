require 'spec_helper'

feature 'visitor can see a list of all existing divesites', %Q{
  As an unauthenticated user
  I want to view all existing divesites
  So I can find a place to dive
} do

  before :each do
    @divesite = FactoryGirl.create(:divesite)
    @divesite2 = FactoryGirl.create(:divesite, name: "Sipadan")
    visit root_path
    click_on "Search for the Perfect Divesite"
  end

  scenario 'visitor sees all existing divesites on webpage' do
    expect(page).to have_content(@divesite.name, @divesite2.name)
    expect(current_path).to eql(divesites_path)
  end


  scenario 'visitor can click on divesite from homepage and see the details in the individual divesite page' do
     click_on "#{@divesite.name}"

     expect(current_path).to eql(divesite_path(@divesite))
     expect(page).to have_content(@divesite.country)
     expect(page).to have_content(@divesite.description)
  end

  scenario 'visitor can see all existing reviews of an individual divesite' do
    review = FactoryGirl.create(:review, divesite: @divesite)
    click_on "#{@divesite.name}"
    click_on "Reviews"

    expect(page).to have_content(review.title)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.rating)
  end
end
