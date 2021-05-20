require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "Can sign in as a user" do

    #NEED TO REFACTOR INTO HELPER METHOD
    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Dob", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "email", with: "jdoe@email.com"
    fill_in "password", with: "password"
    click_button "Login"

    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Welcome, John")
  end

  scenario "Invalid sign in" do
    #NEED TO REFACTOR INTO HELPER METHOD
    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Dob", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "email", with: "jdoe@email.com"
    fill_in "password", with: "password1"
    click_button "Login"

    expect(page).to have_content("Invalid email/password combination")
  end
end