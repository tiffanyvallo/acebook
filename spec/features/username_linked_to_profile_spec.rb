require 'rails_helper'

RSpec.feature "Username links to profile", type: :feature do
  scenario "the username on posts links to the users profile" do

    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "DOB", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #--------------------

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    #--------------------

    click_link "Log out"

    #---------------------

    click_button "Sign Up"
    fill_in "Name", with: "Jane Doe"
    fill_in "Email", with: "janedoe@email.com"
    fill_in "DOB", with: "1994-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"

    #-----------------------

    fill_in "Email", with: "janedoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #----------------------

    click_link "John Doe"
    expect(page).to have_content('John Doe')    
    expect(current_path.split('/')[1]).to eq('users')
  end

  scenario "the username on comments links to the users profile" do

    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "DOB", with: "1992-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"
    #---------------------

    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #--------------------

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    #--------------------

    click_link "Log out"

    #---------------------

    click_button "Sign Up"
    fill_in "Name", with: "Jane Doe"
    fill_in "Email", with: "janedoe@email.com"
    fill_in "DOB", with: "1994-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"

    #-----------------------

    fill_in "Email", with: "janedoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #----------------------

    fill_in "comment[body]", with: "Hello, world!"
    click_button "Post"

    #---------------------

    click_link "Log out"

    #---------------------

    click_button "Sign Up"
    fill_in "Name", with: "Judy Doe"
    fill_in "Email", with: "judydoe@email.com"
    fill_in "DOB", with: "1972-01-01" 
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"
    
    #---------------------

    fill_in "Email", with: "judydoe@email.com"
    fill_in "Password", with: "password"
    click_button "Login"

    #---------------------

    click_link "Jane Doe"
    expect(page).to have_content('Jane Doe')    
    expect(current_path.split('/')[1]).to eq('users')
  end
end