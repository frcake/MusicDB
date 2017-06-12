module ArtistsHelper
  def artists_for_select
    Artist.all.collect {|u| ["#{u.name}", u.id]}
  end

  def song_artist(song)
    name = Artist.find(song.artist_id).name unless song.artist_id.nil?
    
    return "#{name}"
  end
end
