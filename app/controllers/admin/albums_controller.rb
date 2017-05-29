class  Admin::AlbumsController < AdminController
  before_action :find_album, only:[:update,:destroy]
  #before_action :require_admin
  def index_album
    @album = Album.new
    @bands = Band.all.map{|b| [b.name ,b.id]}
    @artists = Artist.all.map{|b| [b.firstname ,b.id]}
    @albums = Album.all.order(release_date: :desc)
  end

  def new_album
    @album = Album.new
    @bands = Band.all.map{|b| [b.name ,b.id]}
    @artists = Artist.all.map{|b| [b.firstname ,b.id]}
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      if params[:images]
        params[:images].each do |image|
          @album.photos.create(image: image)
        end
      else
        @album.photos.create
      end
      respond_to do |format|
        format.js { render 'albums/create.js.erb' }
        format.html {render @albums}
        #format.html {redirect_to admin_albums_new_path}
        #format.json { render @album.errors, status: :unprocessable_entity}

      end
      #redirect_to admin_albums_path
    else
      # respond_to do |format|
      #   format.js { render 'albums/create.js.erb'}
      #   #format.json { render @album.errors, status: :unprocessable_entity}
      #
      # end
      flash[:success] = "Album #{@album.name} is created"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    #,:category_id,
    params.require(:album).permit(:name,:release_date,:photos)
  end
end
