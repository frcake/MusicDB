module AlbumsHelper
  def albums_map_for_select
    Album.all.collect {|u| ["#{u.name}", u.id]}
  end
end
