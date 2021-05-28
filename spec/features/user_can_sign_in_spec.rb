require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "Can sign in as a user" do

    sign_up_john

    log_in_john

    expect(page).to have_current_path("/")
    expect(page).to have_content("Welcome, John")
  end

  scenario "Invalid sign in" do

    sign_up_john

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password1"
    click_button "Login"

    expect(page).to have_content("Invalid email/password combination")
  end
end