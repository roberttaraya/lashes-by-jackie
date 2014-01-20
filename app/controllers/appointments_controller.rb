class AppointmentsController < ApplicationController

  def new
    @user = User.new
  end



end