module SongsHelper
  def song_artist(song)
    firstname = Artist.find(song.artist_id).firstname unless song.artist_id.nil?
    lastname = Artist.find(song.artist_id).lastname unless song.artist_id.nil?
    return "#{firstname} #{lastname}"
  end

  def song_band(song)
    Band.find(song.band_id).name unless song.band_id.nil?
  end

  def song_album(song)
    Album.find(song.album_id).name unless song.album_id.nil?
  end
end
