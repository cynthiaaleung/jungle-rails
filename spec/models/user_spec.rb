require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should create valid user" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynthiaa@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user).to be_valid
    end

    it "should have password and password_confirmation" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynthia@email.com", password: "password", password_confirmation: "pw")
      @user.save
      expect(@user).to_not be_valid
    end

    it "should have matching password and password_confirmation fields" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynthia@email.com", password: "password", password_confirmation: "pw")
      @user.save
      expect(@user.password).to_not eq(@user.password_confirmation)
    end
    
    it "should have a unique email" do
      @user1 = User.create(first_name: "Cynthia", last_name: "Leung", email: "cynthia@email.com", password: "password", password_confirmation: "password")
      @user1.save
      @user2 = User.create(first_name: "Cynthia", last_name: "Leung", email: "CYNthia@email.com", password: "password", password_confirmation: "password")
      @user2.save
      expect(@user2).to_not be_valid
    end

    it "should have a first_name to be a valid user" do
      @user = User.new(first_name: nil, last_name: "Leung", email: "cynthia@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user).to_not be_valid
    end

    it "should have a last_name to be a valid user" do
      @user = User.new(first_name: "Cynthia", last_name: nil, email: "cynthia@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user).to_not be_valid
    end

    it "should have a password with a minimum length of 3" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynthia@email.com", password: "pw", password_confirmation: "pw")
      @user.save
      expect(@user).to_not be_valid
    end

  describe '.authenticate_with_credentials' do
    it "should authenticate user with email and password" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynt@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user.authenticate_with_credentials("cynth@email.com", "password")).to be_nil
    end

    it "should authenticate user with email and password" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynth@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user.authenticate_with_credentials("  cynth@email.com ", "password")).to_not be_nil
    end

    it "should authenticate user with email and password" do
      @user = User.new(first_name: "Cynthia", last_name: "Leung", email: "cynth@email.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user.authenticate_with_credentials("CYNth@email.COM", "password")).to_not be_nil
    end
  end

  end

end

