class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
