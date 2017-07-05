class TracksController < ApplicationController

  before_action :require_login

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @albums = Album.all
    @track = Track.new
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end


  def create
    track = Track.create(track_params)
    if track.save
      redirect_to track_url(track)
    else
      flash.now[:errors] = track.errors.full_messages
    end
  end




  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
    end
  end


  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end

  private

    def track_params
      params.require(:track).permit(:name, :album_id, :bonus)
    end

end
