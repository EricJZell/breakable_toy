class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @entries = @user.entries.order(date: :desc)
  end

  def index
    @users = User.all
  end
end
