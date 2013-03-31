class TweetsController < ApplicationController
  def index
    friendship = User.friends(current_user.id)
    friend_ids = []
    i = 0
    friendship.each do |friend|
      friend_ids[i] = friend.friend_id
      i += 1;
    end
    @tweets = Tweet.where('user_id IN (?,?)', friend_ids,current_user.id).order("created_at DESC")
    #@tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if params[:confirm]
      @tweet = Tweet.new(params[:tweet])
      @tweet.user_id = current_user.id
      if @tweet.save
        flash[:success] = "Tweet Creado"
        redirect_to tweets_path
      else
        flash.now[:error] = "Error al crear el Tweet"
        render 'new'
      end
    else
      redirect_to tweets_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attributes(params[:tweet])
      flash[:success] = "Tweet actualizado!"
      redirect_to tweets_path(params[:id])
    else
      flash.now[:error] = "Error al actualizar. Intente nuevamente mas tarde."
      render 'edit'
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:success] = "Tweet eliminado con exito"
      redirect_to tweets_path
    else
      flash.now[:error] = "Error al eliminar el tweet"
      render "index"
    end
  end
end
