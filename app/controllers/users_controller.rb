class UsersController < ApplicationController
  before_filter :require_same_user_login
  skip_before_filter :require_same_user_login, :only => [:index, :show, :new, :create]
  skip_before_filter :require_login, :except => [:destroy]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash.notice = "#{@user.username} created!"
      redirect_to user_url(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      flash.notice = "#{@user.username} updated!"
      redirect_to user_url(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def require_same_user_login
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:error] = "You are not authorized to edit this resource"
      redirect_to new_session_url
    end
  end
end