module ArtistsHelper
  def artists_for_select
    Artist.all.collect { |u| [u.name.to_s, u.id] }
  end

  def song_artist(song)
    name = Artist.find(song.artist_id).name unless song.artist_id.nil?
    name.to_s
  end
end
