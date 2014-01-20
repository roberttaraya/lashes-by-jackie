class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to user_path(@user.id)
    else
      render new_user_path
    end
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

end