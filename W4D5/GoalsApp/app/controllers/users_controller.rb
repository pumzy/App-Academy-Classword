class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login @user
    else
      flash.now[:errors] =  @user.errors.full_messages
      render :new, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
