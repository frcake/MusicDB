class  Admin::ArtistsController < AdminController
  #before_action :require_admin
  #before_action :find_artist

  def new_artist
    @artist = Artist.new
    @artists = Artist.all.map{|b| [b.firstname ,b.id]}
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
      flash[:success] = "Artist #{@artist.firstname} #{@artist.lastname} is created"
      redirect_to admin_artists_path
    else
      respond_to do |format|
        format.html {render action admin_artist_new_path}
        format.json { render @artist.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    #,:category_id,
    params.require(:artist).permit(:firstname,:lastname,:country,:description,:photos)
  end
end
