class FriendshipController < ApplicationController
  def create
    #@friendship = current_user.friendships.build(:friend_id => params[:user_id])
    friendship_1 = Friendship.new
    friendship_1.user_id = current_user.id
    friendship_1.friend_id = params[:user_id]

    friendship_2 = Friendship.new
    friendship_2.user_id = params[:user_id]
    friendship_2.friend_id = current_user.id
    result = false
    friendship_1.transaction do
      result = friendship_1.save!
      result = friendship_2.save! if result
    end

    if result
      flash[:success] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    friendships = Friendship.where('friend_id = ? and user_id = ?',params[:id],params[:user_id])
    friendships.each do |friendship|
      if friendship.destroy
        flash[:success] = "Eliminado correctamente"
      else
        flash[:error] = "Error en la eliminacion"
      end
    end

    redirect_to user_path(current_user)
  end
end
