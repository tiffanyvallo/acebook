require 'rails_helper'

RSpec.feature "Delete comment", type: :feature do
  scenario "A user can delete a comment from the post" do
    visit "/login"
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
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    # fill_in "Name", with: "Joe"
    fill_in "comment[body]", with: "Hello, person"
    click_button "Post"
    click_button "Delete Comment"
    expect(page).not_to have_content("Hello, person")
  end
end