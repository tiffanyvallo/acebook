require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do

    sign_up_john

    log_in_john

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
  end

  scenario "can see zero likes next to post" do

    sign_up_john

    log_in_john

    post
    expect(page).to have_content("0 likes")
  end

  scenario "can see zero likes next to post" do

    sign_up_john

    log_in_john

    post

    click_link "❤️"
    expect(page).to have_content("1 like")
  end
end
