require 'rails_helper'

RSpec.feature "anonymous can comment on the post", type: :feature do
  scenario "comments appear under the posts" do

    sign_up_john

    log_in_john

    post
    # fill_in "Name", with: "Joe"
    fill_in "comment[body]", with: "Hello, person"
    click_button "Post"
    expect(page).to have_content("Hello, person")
  end
end