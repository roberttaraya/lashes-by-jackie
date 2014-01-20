class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user.nil?
      render new_user_path
    else
      render new_session_path
    end

  end

  def destroy
  end

end