class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    user_params[:user_name],
    user_params[:password]
    )
    if @user
      login(@user)
      redirect_to cats_url
    else
      flash.now[:error] = "invalid credentials"
      render :new
    end

  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
