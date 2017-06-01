module ArtistsHelper
  def artists_for_select
    Artist.all.collect {|u| ["#{u.firstname} #{u.lastname}", u.id]}
  end

  def song_artist(song)
    firstname = Artist.find(song.artist_id).firstname unless song.artist_id.nil?
    lastname = Artist.find(song.artist_id).lastname unless song.artist_id.nil?
    return "#{firstname} #{lastname}"
  end
end
