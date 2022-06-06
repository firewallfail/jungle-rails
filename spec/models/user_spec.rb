require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "succeeds if all fields are valid" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password_digest: "password")
      expect(@user.errors.full_messages).to be_empty
    end
    it "fails if first_name is blank" do
      @user = User.create(last_name: "Hall", email: "test@test.com", password_digest: "password")
      expect(@user.errors.full_messages).not_to be_empty
    end
    it "fails if last_name is blank" do
      @user = User.create(first_name: "Brent", email: "test@test.com", password_digest: "password")
      expect(@user.errors.full_messages).not_to be_empty
    end
    it "fails if email is blank" do
      @user = User.create(first_name: "Brent", last_name: "Hall", password_digest: "password")
      expect(@user.errors.full_messages).not_to be_empty
    end
    it "fails if password_digest is blank" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com")
      expect(@user.errors.full_messages).not_to be_empty
    end
  end

  describe '.authenticate_with_credentials' do
    @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password_digest: "password")
    result = User.authenticate_with_credentials("test@test.com", "password")
    expect(result.email).to be("test@test.com")
  end

end
