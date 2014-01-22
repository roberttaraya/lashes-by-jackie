class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    elsif user.nil?
      render 'users/new'
    else
      render 'sessions/new'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end

end