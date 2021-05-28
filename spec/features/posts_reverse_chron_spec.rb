require 'rails_helper'


RSpec.feature "posts appear in reverse chronologically order", type: :feature do
  scenario "Posts appear in reverse chronologically order" do

    sign_up_john

    log_in_john
    
    post
    
    click_link "New post"
    fill_in "Message", with: "Hello, earth!"
    click_button "Submit"
    first_index = page.body.index('Hello, earth!')
    second_index = page.body.index('Hello, world!')
    expect(first_index).to be < second_index
  end


  # scenario "user can upload one picture per post" do
  #   visit "/posts"
  #   click_link "New post"
  #   fill_in "Message", with: "Hello, world!"
  #   attach_file("Photo", Rails.root + "spec/fixtures/hello_world.png")
  #   click_button "Submit"
    
  #   expect(page).to have_css("img[src*='hello_world.png']")
  # end
end