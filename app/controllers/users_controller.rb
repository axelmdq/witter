class UsersController < ApplicationController
  include UsersHelper
  def show
    @user = User.find(params[:id])
    @comments = Comment.find_all_by_user_id(params[:id])
    @tweets = Tweet.find_all_by_user_id(params[:id])
    #@friends = User.friendship
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Usuario actualizado!"
      session[:user_id] = @user
      redirect_to user_path(params[:id])
    else
      render 'edit'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
=begin
    unless @user.password == params[:reply_password]
      flash.now[:error] = "La contraseña no coincide"
      render "new"
    end
=end
    if @user.save
      flash[:success] = "Muchas gracias por registrarse!"
      redirect_to login_path
    else
      flash.now[:error] = "Error en el registro"
      render "new"
    end
  end

  def index

  end

  def search
    @users = User.search(params[:search])
  end
end
