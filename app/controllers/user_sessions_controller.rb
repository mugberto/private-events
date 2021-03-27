class UserSessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Invalid username'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
