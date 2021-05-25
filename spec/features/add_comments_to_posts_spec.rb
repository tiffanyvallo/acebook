require 'rails_helper'

RSpec.feature "anonymous can comment on the post", type: :feature do
  scenario "comments appear under the posts" do
    visit "/login"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Dob", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Name", with: "Joe"
    fill_in "Body", with: "Hello, person"
    click_button "Create Comment"
    expect(page).to have_content("Hello, person")
  end
end