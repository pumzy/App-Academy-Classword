class UsersController < ApplicationController

def new
  @user = User.new
  render :new
end

def create
  @user = User.new(user_params)
  if @user.save
    log_in_user!(@user)
    redirect_to bands_url
  else
    flash.now[:errors] = @user.errors.full_messages
  end
end

def show
  id = params[:id]
  @user = User.find_by(id: id)
end

private
def user_params
  params.require(:user).permit(:email, :password)
end

end
