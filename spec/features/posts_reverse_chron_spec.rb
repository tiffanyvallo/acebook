require 'rails_helper'


RSpec.feature "posts appear in reverse chronologically order", type: :feature do
  scenario "Posts appear in reverse chronologically order" do
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