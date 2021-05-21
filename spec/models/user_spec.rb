require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.new(name: "John Doe", 
                    email: "jdoe@email.com",
                    password: "password", 
                    password_confirmation: "password")
  end

  subject { @user }
  
  it { is_expected.to be }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  describe "remember token" do
    before { @user.save }
    it(:remember_token) { should_not be_blank }
  end


end