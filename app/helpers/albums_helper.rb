module AlbumsHelper
  def albums_map_for_select
    Album.all.collect { |u| [u.name.to_s, u.id] }
  end
end
