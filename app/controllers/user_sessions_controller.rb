class UserSessionsController < ApplicationController
  before_filter :render_404, :except => [:new, :create, :destroy]
  before_filter :require_user, :only => [:destroy]
  layout nil
  
  #/admin
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_url
    else
      redirect_to admin_url
    end
  end
  
  #/users_session
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to admin_url
  end
end