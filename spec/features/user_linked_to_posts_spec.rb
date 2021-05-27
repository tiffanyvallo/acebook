require 'rails_helper'

RSpec.feature "posts are linked to users", type: :feature do
  scenario "Can sign in as a user" do

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

    #--------------------

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_content("John Doe")

  end
end