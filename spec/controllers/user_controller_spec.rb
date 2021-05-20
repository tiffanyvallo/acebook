require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "User can visit root page" do
    describe "GET /" do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  context "User can sign up to create account" do
    describe "GET /new " do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /" do
      it "responds with 200" do
        post :create, params: { user: { name: "John Doe", dob: 1991-01-01, email: "jdoe@email.com", password: "password", password_confirmation: "password" } }
        expect(response).to redirect_to("/")
      end

      it "creates a user" do
        post :create, params: { user: { name: "John Doe", dob: 1991-01-01, email: "jdoe@email.com", password: "password", password_confirmation: "password" } }
        expect(User.find_by(name: "John Doe")).to be
      end
    end
  end


  # context "User can log in" do
  #   describe "POST /posts" do
  #     it "responds with 200" do
  #       # post :create, session: { user: { email: "jdoe@email.com", password: "password" } }
  #       expect(response).to redirect_to("/posts")
  #     end
  #   end
  # end
end