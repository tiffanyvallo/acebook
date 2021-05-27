require 'rails_helper'

RSpec.feature "Likes are linked to users", type: :feature do
  scenario "Can like a post" do

    sign_up_john

    log_in_john

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Log out"

    sign_up_jane

    log_in_jane

    click_link "❤️"
    click_link "❤️"
    expect(page).to have_content("1 like")    
  end
end