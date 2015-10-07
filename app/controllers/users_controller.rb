class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @entries = @user.entries
  end

  def index
    @users = User.all
  end
end
