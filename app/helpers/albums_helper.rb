module AlbumsHelper
  def albums_map_for_select
    Album.all.collect {|u| ["#{u.name}", u.id]}
  end
  # def song_album(song)
  #   Album.find(song.album_id).name unless song.album_id.nil?
  # end
end
