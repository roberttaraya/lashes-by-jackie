class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user.nil?
      render 'users/new'
    else
      render 'sessions/new'
    end

  end

  def destroy
  end

end