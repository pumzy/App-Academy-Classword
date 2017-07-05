class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password] )
    
    if @user
      login @user
    else
      @user = User.new(username: params[:user][:username])
      flash.now[:errors] = ["Couldn't find user wih that username and password"]
      render :new, status:422
    end
  end

  def destroy
    logout!
  end


end
