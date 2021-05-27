require 'rails_helper'

def sign_up_john
  visit "/"
  click_button "Sign Up"
  fill_in "Name", with: "John Doe"
  fill_in "Email", with: "jdoe@email.com"
  fill_in "DOB", with: "1992-01-01" 
  fill_in "Password", with: "password"
  fill_in "Password Confirmation", with: "password"
  click_button "Create Account"
end

def log_in_john
  fill_in "Email", with: "jdoe@email.com"
  fill_in "Password", with: "password"
  click_button "Login"
end

def sign_up_jane
  click_button "Sign Up"
  fill_in "Name", with: "Jane Doe"
  fill_in "Email", with: "janedoe@email.com"
  fill_in "DOB", with: "1994-01-01" 
  fill_in "Password", with: "password"
  fill_in "Password Confirmation", with: "password"
  click_button "Create Account"
end

def log_in_jane
  fill_in "Email", with: "janedoe@email.com"
  fill_in "Password", with: "password"
  click_button "Login"
end

def post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end