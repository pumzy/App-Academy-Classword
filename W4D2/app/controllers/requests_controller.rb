class RequestsController < ApplicationController
  def index
    redirect_to new_request_url
  end

  def new
    @cats = Cat.all
    render :new
  end

  def update
    @request = CatRentalRequest.find_by(id: params[:id]).approve!
    redirect_to cat_url
  end

  def create
    req = CatRentalRequest.new(req_params)
    if req.save
      redirect_to cats_url
    else
      render text: req.errors.full_messages
    end
  end


  private

  def req_params
    params.require(:req).permit(:cat_id, :start_date, :end_date)
  end

end
