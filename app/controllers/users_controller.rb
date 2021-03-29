class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: 'New user created'
    else
      render :new
    end
  end

  def show
    @events = current_user.events
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
