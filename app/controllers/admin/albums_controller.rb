class  Admin::AlbumsController < AdminController
  include PhotosHelper
  before_action :find_album, only: [:update,:show,:destroy,:edit]
  #before_action :require_admin
  def index_album
    @albums = Album.all.order(updated_at: :desc)
  end

  def new_album
    @album = Album.new
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
      flash[:success] = "Album #{@album.name} is created"
      redirect_to admin_albums_path
    else
      respond_to do |format|
        #format.js { render 'albums/create.js.erb' }
        format.html {redirect_to admin_albums_new_path}
        format.json { render @album.errors, status: :unprocessable_entity}

      end
    end
  end

  def edit_album
    @album = Album.find(params[:id])
  end

  def update
    if @album.update_attributes(album_params)
      if params[:images]
        @album.photos.each do |image|
          image.delete if image.image_file_size.nil?
        end
        params[:images].each do |image|
          @album.photos.create(image: image)
        end
      else
        @album.photos.create unless @album.photos.exists?
      end
      flash[:success] = "Album updated!"
      redirect_to admin_albums_path
    else
      respond_to do |format| ## Add this
        format.html { redirect_to admin_albums_edit_path(@album) }
        format.json { render json:  @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end


  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name,:artist_id,:category_id,:band_id,:release_date,:photos)
  end
end
