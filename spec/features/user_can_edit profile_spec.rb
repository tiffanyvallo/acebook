require 'rails_helper'

RSpec.feature "Edit profile", type: :feature do
  scenario "Can edit name" do

    #NEED TO REFACTOR INTO HELPER METHOD
    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "DOB", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #---------------------

    click_link 'Profile'
    click_link 'Settings'
    fill_in "Name", with: "Joe Blogs"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button 'Save changes'

    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #---------------------

    expect(page).to have_content("Welcome, Joe")
  end
end