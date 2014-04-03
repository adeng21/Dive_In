require 'spec_helper'

feature 'user sign in', %Q{
  As an unauthenticated user
  I want to sign in
  So I can contribute to the community
} do

  before :each do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
  end

  scenario 'user provides correct sign in information' do

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within('form') do
      click_button 'Sign in'
    end

    expect(page).to have_content("Signed in successfully")
    expect(current_path).to eql(root_path)
  end

  scenario 'user provides incorrect email' do
    fill_in 'Email', with: 'garbage@garbage.com'
    fill_in 'Password', with: @user.password
    within('form') do
      click_button 'Sign in'
    end

    expect(page).to have_content("Invalid email or password.")
    expect(page).to_not have_content("Signed in successfully")

  end

   scenario 'user provides incorrect password' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'passwordfoo'
    within('form') do
      click_button 'Sign in'
    end

    expect(page).to have_content("Invalid email or password.")
    expect(page).to_not have_content("Signed in successfully")

  end


end
