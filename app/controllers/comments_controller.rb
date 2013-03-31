class CommentsController < ApplicationController
  def new
    @comment = Comment.new

  end

  def create
    @comment = Comment.create(params[:comment])
    @comment.tweet_id = params[:tweet_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Mensaje ingresado con exito"
      redirect_to tweets_path
    else
      flash.now[:error] = "Error!"
      render "new"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end