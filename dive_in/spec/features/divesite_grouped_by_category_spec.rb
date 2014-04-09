require 'spec_helper'

feature 'divesites are grouped by categories that they are best known for', %Q{
  As a visitor
  I want to view the categories each divesite is best known for
  So that I can pick the divesite that best fits my preferences
} do

  #ACCEPTANCE CRITERIA
  #Each individual divesite has at least one category, and a maximum of four
  #Each category must be selected from one of the following:
    #Wrecks/Artifacts, Cave, Drift, Whales & Sharks, Macro/Corals, Manta Rays,
    #Turtles, Night, Schools of Fish, Wall
  #Visitor can view divesites listed under each category

  before :each do
    @divesite = FactoryGirl.create(:divesite)
    @category = FactoryGirl.create(:category)
    @category2 = FactoryGirl.create(:category, name: "Caves")
    @divesite.categories << @category
    @divesite.categories << @category2
  end

  scenario 'visitor sees the categories a divesite is best known for' do
    visit divesites_path
    click_on @divesite.name

    expect(page).to have_content("Caves")
    expect(page).to have_content("Manta Rays")
  end

  scenario 'visitor sees the best divesites under each category from the homepage' do
    visit root_path
    click_on @category2.name

    expect(page).to have_content(@divesite.name)
    expect(current_path).to eql(category_path(@category2))
  end

  scenario 'visitor can see the best divesites in a category from an individual divesite page' do
    visit divesite_path(@divesite)
    click_on @category.name

    expect(page).to have_content(@divesite.name)
    expect(current_path).to eql(category_path(@category))
  end
end
