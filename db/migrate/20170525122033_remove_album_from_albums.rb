class RemoveAlbumFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :album_id , :references
  end
end
