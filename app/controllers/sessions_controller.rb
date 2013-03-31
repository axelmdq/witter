class SessionsController < ApplicationController
  def login
  end

  def new
  end

  def create
    user = User.authenticate(params[:username],params[:password])
    if user
        session[:user_id] = user.id
        redirect_to tweets_path
    else
        flash.now[:error] = "Error de login"
        render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
