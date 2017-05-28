class Admin::SongsController < AdminController
  before_action :set_songs, only:[:update,:destroy]

  def new_song
    @song = Song.new
    @albums = Album.all.map{|x| [x.name ,x.id]}
    @artists = Artist.all.map{|x| ["#{x.firstname} #{x.lastname}" ,"#{x.id}"]}
    #@artists = Artist.all.map{|x| [x.lastname ,x.lastname, x.id]}
  end

  def create
    @song = Song.new(song_params)
    @song.album_id = params[:album_id]
    @song.artist_id = params[:artist_id]
    if @song.save!
      redirect_to admin_songs_path
      flash[:info] = "Song #{@song.name} saved!"
    else
      respond_to do |format|
        format.html {redirect_to admin_songs_new_path}
        format.json {render @song.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_songs
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name,:genre,:album_id,:artist_id)
  end
end
