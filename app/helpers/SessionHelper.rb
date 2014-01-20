module SessionHelper

  def logout
    session.clear
    @user = nil
  end

