require 'spec_helper'

feature 'a signed in user can submit a review for an existing divesite', %Q{
  As a signed in user
  I want to be able to submit a review for an existing divesite
  So I can contribute my opinions to the site
} do

  #ACCEPTANCE CRITERIA
  #User must be signed in, in order to submit a review
  #User must specify a time and a minimum amount of words to give a valid review
  #A User that is not signed in can view existing reviews, but not submit one of his own
  #Each divesite page has a reviews page

  scenario 'signed in user submits a valid review' do
    divesite = FactoryGirl.create(:divesite)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on "Best Divesites in the World"
    click_on divesite.name
    click_on 'Submit a Review'
    fill_in 'Date', with: "March 2014"
    fill_in 'Rating', with: 5
    fill_in 'Title', with: 'Fantastic dive'
    fill_in 'Body', with: "Best place I've ever dived. So many fish to see"
    click_on 'Submit Review'

    expect(page).to have_content("Review Successfully Submitted!")
    expect(divesite.reviews.count).to eql(1)
  end

  scenario 'signed in user submits an invalid review'


  scenario 'a visitor/un-signed in user can view existing reviews but not submit one of his own'

end
