class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    if log_in(params[:user][:username], params[:user][:password])
      redirect_to root_url
    else
      flash.now[:error] = ["Incorrect username or password!"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end