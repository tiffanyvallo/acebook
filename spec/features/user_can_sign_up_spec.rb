require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can sign up as a user" do
    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Date of Birth", with: "1/1/1992"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button "Create Account"

    expect(current_path).to_eq("/")
    expect(page).to have_content("Success: New Account Created") #flash message 
  end
end