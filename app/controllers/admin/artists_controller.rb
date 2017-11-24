class Admin::ArtistsController < AdminController
  include PhotosHelper
  before_action :require_admin
  before_action :find_artist, only: %i[update delete]

  def index_artist
    @artists = Artist.all
  end

  def new_artist
    @artist = Artist.new
    @artists = Artist.all.map { |b| [b.name, b.id] }
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      if params[:images]
        params[:images].each do |image|
          @artist.photos.create(image: image)
        end
      else
        @artist.photos.create
      end
      flash[:success] = "Artist #{@artist.name} is created"
      redirect_to admin_artists_path
    else
      flash[:warning] = 'Please try again'
      action admin_artist_new_path
    end
  end

  def edit_artist
    @artist = Artist.find(params[:id])
  end

  def update; end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    # ,:category_id,
    params.require(:artist).permit(:name, :country, :category_id, :description, :photos)
  end
end
