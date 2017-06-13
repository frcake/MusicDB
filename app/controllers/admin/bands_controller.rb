class Admin::BandsController < AdminController
  include PhotosHelper
  before_action :set_band, only:[:update,:destroy]
  before_action do
    @discogs = Discogs::Wrapper.new("Test OAuth", user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
  end

  def index_band
    @bands = Band.all
  end



  def new_band
    #@array = []

    @band = Band.new
    @artists = Artist.all.map{|x| ["#{x.name}" ,"#{x.id}"]}
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      # byebug
      if params[:band][:artists]
        params[:band][:artists].each do |artist|
          @bandmembers = @band.bandmembers.build(artist_id: artist) #unless artist.empty?
          @bandmembers.save #unless artist.empty?
          ## byebug
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
    @artists = Artist.all.map{|x| ["#{x.name}" ,"#{x.id}"]}

    @count = Bandmember.where(band_id: @band.id)
    #byebug
    @array = []
    if @count.size > 1
      @count.each do |artist|
        @artist = Artist.find(artist.artist_id).id
        @array << @artist
      end
    elsif @count.size == 1
      @count = Bandmember.find_by(band_id: @band.id)
      @artist = Artist.find(@count.artist_id).id
      @array << @artist
    else
      @array = [""]
    end
    #@array = [""]
    #byebug
  end
  #@selected_artists = @array.map{|x| ["#{x.name}" ,"#{x.id}"]}



  def update
    #byebug
    if @band.update_attributes(band_params)
      if params[:band][:artists]
        params[:band][:artists].each do |artist|
          @bandmembers = @band.bandmembers.build(artist_id: artist) #unless artist.empty?
          @bandmembers.save #unless artist.empty?
          ## byebug
        end
      end
      flash[:success] = "good"
      redirect_to admin_bands_edit_path
    else
    end
  end

  def destroy
    @band.destroy
    redirect_to admin_bands_path
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name,:genre,:description,:artist,:photos,:category_id,artists:[:id])#,bandmember:[:band_id,:artist_id])
  end
end
