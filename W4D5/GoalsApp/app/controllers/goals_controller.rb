class GoalsController < ApplicationController

  def index
  end

  def new
  end

  def show
  end

  def destroy
  end

  def create
    @goal = Goal.new(goal_params)
    user = self.current_user
    debugger
    @goal.user_id = self.current_user.id

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new, status: 422
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :steps, :private?, :completed?)
  end
end
