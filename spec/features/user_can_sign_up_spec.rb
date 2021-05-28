require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can sign up as a user" do

    sign_up_john

    expect(page).to have_current_path('/login')
    expect(page).to have_content("Success: New Account Created")
    expect(page).to have_content("W E L C O M E T O A C E B O O K")
  end
end