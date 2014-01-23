require 'spec_helper'

describe User do
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

  it "is invalid without an email address" do
    expect(User.new(email: nil)).to have(2).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    User.create(
      first_name: "John",
      last_name: "Doe",
      email: "duplicate@example.com",
      password: "password",
      password_confirmation: "password")

    user = User.new(
      first_name: "Jane",
      last_name: "Doe",
      email: "duplicate@example.com",
      password: "password",
      password_confirmation: "password")

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
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      password: "password",
      password_confirmation: "password")

    expect(user.name).to eq("John Doe")
  end
end