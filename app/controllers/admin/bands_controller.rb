class Admin::BandsController < AdminController
  include PhotosHelper
  before_action :set_band, only:[:update,:destroy]
  def index_band
    @bands = Band.all
  end

  def new_band
    @band = Band.new
    @artists = Artist.all.map{|x| ["#{x.firstname} #{x.lastname}" ,"#{x.id}"]}

  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      if params[:artists]
        params[:artists].each do |artist|
          @bandmembers = @band.bandmembers.build(artist_id: artist)
          @bandmembers.save
        end
      end
      if params[:images]
        params[:images].each do |image|
          @band.photos.create(image: image)
        end
      else
        @band.photos.create
      end
      flash[:success] = "Band #{@band.name} is created"
      redirect_to admin_bands_path
    else
      flash[:warning] = "Please try again"
      redirect_to admin_bands_new_path
    end
  end

  def edit_band
    @band = Band.find(params[:id])
    @artists = Artist.all.map{|x| ["#{x.firstname} #{x.lastname}" ,"#{x.id}"]}
  end

  def update
    if @band.update_attributes(band_params)
      flash[:success] = "Band updated!"
      redirect_to admin_bands_path
    else
      flash[:warning] = "Please try again"
      redirect_to admin_bands_edit_path(@band)
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name,:genre,:description,:artist,:photos,:category_id,bandmember:[:band_id,:artist_id])
  end
end
