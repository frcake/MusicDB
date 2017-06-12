class RemoveAlbumFromSongs < ActiveRecord::Migration[5.1]
  def change
   remove_column :songs , :album_id
  end
end
