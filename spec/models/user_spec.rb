require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should create a valid user" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "should not create user when password is different from confirmation" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "passwor", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create user when password is blank" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "should not create user when the email is taken" do
      @user1 = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: "Brent", last_name: "Hall", email: "TEST@TEST.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
    end

    it "should not create user when name(first or last) is blank" do
      @user1 = User.create(first_name: nil, last_name: "Hall", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: "Brent", last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user1).to_not be_valid
      expect(@user2).to_not be_valid
    end

    it "should not create user when email is blank" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user with a password less than 4 characters" do
      @user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "pas", password_confirmation: "pas")
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "should return the user on authentication" do
      user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "password", password_confirmation: "password")
      authentication = User.authenticate_with_credentials("test@test.com", "password")

      expect(authentication).to be_a(User)
      expect(authentication.email).to eq("test@test.com")
    end

    it "should return the user on login with additional spaces and case sensitive" do
      user = User.create(first_name: "Brent", last_name: "Hall", email: "test@test.com", password: "password", password_confirmation: "password")

      authentication = User.authenticate_with_credentials(" test@test.com ", "password")

      expect(authentication).to be_a(User)
      expect(authentication.email).to eq("test@test.com")
    end
  end
end