class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @friends = @user.friends
  end

  def create
    @friendship = current_user.friendships.build(
      friend_id: params[:friend_id], accepted: "false"
    )
    if @friendship.save
      flash[:notice] = "Friend requested."
      redirect_to :back
    else
      flash[:warning] = @friendship.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.where(
      friend_id: current_user, user_id: params[:id]
    ).first
    @friendship.update(accepted: true)
    if @friendship.save
      flash[:success] = "Successfully confirmed friend!"
    else
      flash[:error] = "Sorry! Could not confirm friend!"
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @friendship = Friendship.where(
      friend_id: [current_user, params[:id]]
    ).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "Friendship declined."
    redirect_to :back
  end
end
