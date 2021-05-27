require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can sign up as a user" do

    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "DOB", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_current_path('/login')
    expect(page).to have_content("Success: New Account Created")
    expect(page).to have_content("Welcome to Acebook")
  end
end