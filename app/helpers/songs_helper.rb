module SongsHelper
  def song_album(song)
    Song.find(song.id).albums
  end
end
