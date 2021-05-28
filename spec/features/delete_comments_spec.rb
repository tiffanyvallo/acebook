require 'rails_helper'

RSpec.feature "Delete comment", type: :feature do
  scenario "A user can delete a comment from the post" do
    
    sign_up_john

    log_in_john

    post
    # fill_in "Name", with: "Joe"
    fill_in "comment[body]", with: "Hello, person"
    click_button "Post"
    click_button "❌"
    expect(page).not_to have_content("Hello, person")
  end
end