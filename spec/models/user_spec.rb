require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is valid with a first_name, last_name, cell_phone, email, password, password_confirmation" do
    user = User.new(
      first_name: "Jackie",
      last_name: "Luu",
      cell_phone: "469-888-0086",
      email: "jackie@example.com",
      password: "password",
      password_confirmation: "password")
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user).to have(2).errors_on(:first_name)
  end

  it " is invalid without a first name with at least 2 characters" do
    user = FactoryGirl.build(:user, first_name: "L")
    expect(user).to have(1).errors_on(:first_name)
  end

  it "is invalid without an email address" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to have(2).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user,
      email: "duplicate@example.com")

    user = FactoryGirl.build(:user,
      email: "duplicate@example.com")

    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
    expect(User.new(password: nil)).to have(1).errors_on(:password_digest)
  end

  it "is invalid without a password that is at least 6 characters long" do
    expect(User.new(password: "pw")).to have(1).errors_on(:password)
  end

  it "is invalid without a password confirmation" do
    expect(User.new(password_confirmation: nil)).to have(1).errors_on(:password_confirmation)
  end

  it "returns a user's full name as a string" do
    user = FactoryGirl.build(:user,
      first_name: "John",
      last_name: "Doe")

    expect(user.name).to eq("John Doe")
  end

  describe "filter last name by letter" do
    before :each do
      @smith = User.create(
          first_name: "John",
          last_name: "Smith",
          email: "johnsmith@example.com",
          password: "password",
          password_confirmation: "password")
      @jones = User.create(
          first_name: "John",
          last_name: "Jones",
          email: "johnjones@example.com",
          password: "password",
          password_confirmation: "password")
      @jackson = User.create(
          first_name: "John",
          last_name: "Jackson",
          email: "johnjackson@example.com",
          password: "password",
          password_confirmation: "password")
    end

    context "matching letters" do
      it "returns a sorted array of results that match" do
        expect(User.by_last_initial("J")).to eq [@jackson, @jones]
      end
    end

    context "non-matching letters" do
      it "returns a sorted array of results that match" do
        expect(User.by_last_initial("J")).to_not include @smith
      end
    end
  end
end