require 'spec_helper'

describe UsersController do

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
        post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "signs in the new user" do
      end

      it "redirects to users#show" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      user = create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
    it "renders the :show template" do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "PUT #update" do
    before :each do
      @user = create(:user,
        first_name: "John", last_name: "Smith")
    end

    context "with valid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's attributes in the database" do
        put :update, id: @user,
          user: attributes_for(:user,
            first_name: "Johnny", last_name: "Smith")
          @user.reload
          expect(@user.first_name).to eq("Johnny")
          expect(@user.last_name).to eq("Smith")
      end

      it "redirects to the :show template" do
        get :show, id: @user
        expect(response).to render_template 'show'
      end
    end

    context "with invalid attributes" do
      it "does not update the user's attributes" do
        put :update, id: @user,
          user: attributes_for(:user,
            first_name: nil, last_name: "Smith")
        @user.reload
      expect(@user.first_name).to eq("John")
      expect(@user.first_name).to_not eq("Smith")
      end

      it "re-renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the user from the database"
    it "redirects to the users#index"
  end

end
