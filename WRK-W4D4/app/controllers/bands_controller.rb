class BandsController < ApplicationController

before_action :require_login

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end


  def create
    band = Band.create(band_params)
    if band.save
      redirect_to band_url(band)
    else
        flash.now[:errors] = band.errors.full_messages
    end
  end




  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
    end
  end


  def destroy
    @band.destroy
    redirect_to bands_url
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end


end
