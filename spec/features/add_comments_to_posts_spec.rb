require 'rails_helper'

RSpec.feature "anonymous can comment on the post", type: :feature do
  scenario "comments appear under the posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Comment", with: "Hello, person"
    click_button "Add comment"
    expect(page).to have_content("Hello, person")
  end
end