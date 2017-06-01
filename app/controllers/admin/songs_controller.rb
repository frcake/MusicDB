class Admin::SongsController < AdminController
  before_action :set_songs, only:[:update,:destroy]

  def index_song
    @songs = Song.all
  end

  def new_song
    @song = Song.new
    @albums = Album.all.map{|x| [x.name ,x.id]}
    @artists = Artist.all.map{|x| ["#{x.firstname} #{x.lastname}" ,"#{x.id}"]}
  end

  def create
    @song = Song.new(song_params)
    @album = Album.find(song_params[:album_id])
    @song.album_id = song_params[:album_id]
    @song.category_id = @album.category_id
    @song.artist_id = @album.artist_id unless @album.artist_id.nil?
    @song.band_id = @album.band_id unless @album.band_id.nil?

    if @song.save!
      if params[:album_id]

      end
      flash[:success] = "Song #{@song.name} saved!"
      redirect_to admin_songs_path
    else
      flash[:danger] = "Please try again"
      redirect_to admin_songs_new_path
    end
  end


  def edit_song
    @song = Song.find(params[:id])
  end

  def update
    if @song.update_attributes(song_params)
      flash[:success] = "Album updated!"
      redirect_to admin_songs_path
    else
      flash[:warning] = "Please try again"
      redirect_to admin_songs_edit_path(@song)
    end
  end

  def destroy
    @song.destroy
    flash[:success] = "Album deleted!"
    redirect_to admin_songs_path
  end

  private

  def set_songs
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name,:album_id,:artist_id,:band_id)
  end
end
