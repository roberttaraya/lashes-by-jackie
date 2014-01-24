require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is valid with a first_name, last_name, cell_phone, email, password, password_confirmation" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without a first name" do
    expect(build(:user, first_name: nil)).to have(2).errors_on(:first_name)
  end

  it " is invalid without a first name with at least 2 characters" do
    expect(build(:user, first_name: "L")).to have(1).errors_on(:first_name)
  end

  it "is invalid without an email address" do
    expect(build(:user, email: nil)).to have(2).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "duplicate@example.com")
    expect(build(:user, email: "duplicate@example.com")).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
    expect(build(:user, password: nil)).to have(1).errors_on(:password_digest)
  end

  it "is invalid without a password that is at least 6 characters long" do
    expect(build(:user, password: "pw", password_confirmation: "pw")).to have(1).errors_on(:password)
  end

  it "is invalid without a password confirmation" do
    expect(build(:user, password_confirmation: nil)).to have(1).errors_on(:password_confirmation)
  end

  it "returns a user's full name as a string" do
    user = build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq("John Doe")
  end

  describe "filter last name by letter" do
    before :each do
      @smith = create(:user, last_name: "Smith")
      @jones = create(:user, last_name: "Jones")
      @jackson = create(:user, last_name: "Jackson")
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