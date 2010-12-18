class UsersController < ApplicationController
  before_filter :require_user
  layout 'blog'
  #/users
  def index
    @users = User.all
  end

  #/users/1
  def show
  end

  #/users/new
  def new
    @user = User.new
  end

  #/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render :action => "edit"
    end
  end

  #/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
end
