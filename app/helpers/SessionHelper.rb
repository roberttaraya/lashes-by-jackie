module SessionHelper

  def logout
    session.clear
    @user = nil
  end

  def current_user
    @user ||=