require 'spec_helper'

describe UsersController do

  describe "GET #index" do
    it "renders the :index view"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database"
      it "signs in the new user"
      it "redirects to users#show"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end

  describe "GET #new" do
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested user to @user"
    it "renders the :edit template"
  end

  describe "GET #show" do
    it "assigns the requested user to @user"
    it "renders the :show template"
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the user in the database"
      it "redirects to the :show template"
    end

    context "with invalid attributes" do
      it "does not update the user"
      it "re-renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the user from the database"
    it "redirects to the users#index"
  end

end
