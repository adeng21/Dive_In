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
  click_on "Best Divesites in the World"
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




end
