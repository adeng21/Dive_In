require 'spec_helper'

feature 'a signed in user can submit a review for an existing divesite', %Q{
  As a signed in user
  I want to be able to submit a review for an existing divesite
  So I can contribute my opinions to the site
} do

  #ACCEPTANCE CRITERIA
  #User must be signed in, in order to submit a review
  #User must specify a date, a title and body to give a valid review
  #A User that is not signed in can view existing reviews, but not submit one of his own
  #Each divesite page has a reviews page
  #If a user is deleted, his reviews stay on the divesite page
  #If a divesite is deleted, all reviews are deleted

  before :each do
    @divesite = FactoryGirl.create(:divesite)
  end

  scenario 'signed in user submits a valid review' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on "Best Divesites in the World"
    click_on @divesite.name
    click_on 'Submit a Review'
    find(:css, "#review_date_1i").select("2014")
    find(:css, "#review_date_2i").select("May")
    find(:css, "#review_date_3i").select("5")
    select "5", from: 'Rating'
    fill_in 'Title', with: 'Fantastic dive'
    fill_in 'Body', with: "Best place I've ever dived. So many fish to see"
    click_on 'Create Review'

    expect(page).to have_content("Review Successfully Submitted!")
    expect(@divesite.reviews.count).to eql(1)
  end

  scenario 'signed in user submits an invalid review' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on "Best Divesites in the World"
    click_on @divesite.name
    click_on 'Submit a Review'
    find(:css, "#review_date_1i").select("2014")
    find(:css, "#review_date_2i").select("May")
    find(:css, "#review_date_3i").select("5")
    select "5", from: 'Rating'
    fill_in 'Title', with: ""
    fill_in 'Body', with: ""
    click_on 'Create Review'

    expect(page).to_not have_content("Review Successfully Submitted!")
    expect(@divesite.reviews.count).to eql(0)
  end


  scenario 'a visitor/un-signed in user can not submit a review' do
    visit root_path
    click_on "Best Divesites in the World"
    click_on @divesite.name

    expect(page).to_not have_content("Submit a Review")
  end

  scenario 'a user is deleted but his reviews are not deleted' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user, divesite: @divesite)
    user.destroy

    expect(@divesite.reviews.count).to eql(1)
  end

  scenario 'a divesite is deleted, and all its reviews are deleted' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user, divesite: @divesite)
    @divesite.destroy

    expect(@divesite.reviews.count).to eql(0)
  end

end


