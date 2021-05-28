require 'rails_helper'

RSpec.feature "posts are linked to users", type: :feature do
  scenario "Can sign in as a user" do

    sign_up_john

    log_in_john

    post

    expect(page).to have_content("John Doe")

  end
end