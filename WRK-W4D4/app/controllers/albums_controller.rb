class AlbumsController < ApplicationController

  before_action :require_login

    def index
      @albums = Album.all
      render :index
    end

    def show
      @album = Album.find(params[:id])
      render :show
    end

    def new
      @bands = Band.all
      @album = Album.new
    end

    def edit
      @bands = Band.all
      @album = Album.find(params[:id])
      render :edit
    end


    def create
      album = Album.create(album_params)
      if album.save
        redirect_to album_url(album)
      else
        flash.now[:errors] = album.errors.full_messages
      end
    end




    def update
      @album = Album.find(params[:id])
      if @album.update(album_params)
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
      end
    end


    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to albums_url
    end

    private

      def album_params
        params.require(:album).permit(:name, :band_id, :venue)
      end

end
