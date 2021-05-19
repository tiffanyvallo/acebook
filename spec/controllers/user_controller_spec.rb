require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { user: { name: "John Doe", dob: 1991-01-01, email: "jdoe@email.com", password: "password" } }
      expect(response).to redirect_to("/")
    end

    it "creates a user" do
      post :create, params: { user: { name: "John Doe", dob: 1991-01-01, email: "jdoe@email.com", password: "password" } }
      expect(User.find_by(name: "John Doe")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end