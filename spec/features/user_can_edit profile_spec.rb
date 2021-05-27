require 'rails_helper'

RSpec.feature "Edit profile", type: :feature do
  scenario "Can edit name" do

    #NEED TO REFACTOR INTO HELPER METHOD
    sign_up_john

    log_in_john

    click_link 'Profile'
    click_link 'Settings'
    fill_in "Name", with: "Joe Blogs"
    fill_in "Password", with: "password"
    click_button 'Save changes'

    visit "/login"
    log_in_john

    expect(page).to have_content("Welcome, Joe")
  end
end