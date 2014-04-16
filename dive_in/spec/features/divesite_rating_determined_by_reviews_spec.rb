require 'spec_helper'

feature 'overall rating for a divesite is partially determined by reviews submitted by users', %Q{
  As an authenticated user
  I want to help determine the overall rating of a divesite
  So that I can contribute my opinion to the website
} do

  #ACCEPTANCE CRITERIA
  #If no reviews are given for a specific divesite, the rating is determined by the original rating input by admin
  #If 10 or less reviews are given for a specific divesite, the overall rating is 50% from users and 50% from admin
  #If more than 10 reviews are given for a specific divesite, the overall rating is 100% determined by users

  before :each do
    @divesite = FactoryGirl.create(:divesite)
  end

  scenario 'divesite has no reviews' do

  expect(@divesite.overall_rating).to eql(@divesite.rating)
  end

  scenario 'divesite has 10 reviews' do
    FactoryGirl.create_list(:review, 10, rating: 3, divesite: @divesite)

  expect(@divesite.overall_rating).to eql(4)
  end

  scenario 'divesite has more than 10 reviews' do
    FactoryGirl.create_list(:review, 20, rating: 3, divesite: @divesite)

  expect(@divesite.overall_rating).to eql(3)
  end
end
