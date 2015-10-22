class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(
      friend_id: params[:friend_id], accepted: "false"
    )
    if @friendship.save
      flash[:notice] = "Friend requested."
      redirect_to :back
    else
      flash[:error] = "Unable to request friendship."
      redirect_to :back
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
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

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.where(
      friend_id: [current_user, params[:id]]
    ).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "Friendship declined."
    redirect_to :back
  end
end
