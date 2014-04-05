require 'spec_helper'

feature 'user can see a list of all existing divesites', %Q{
  As an authenticated user
  I want to view all existing divesites
  So I can find a place to dive
} do

before :each do
  user = FactoryGirl.create(:user)
  sign_in_as(user)
end

scenario 'user signs in and sees all existing divesites on webpage'











scenario 'user can click on divesite from homepage and see the details in the individual divesite page'








end
