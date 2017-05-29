class RemoveAlbumsFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :album_id, :bigint
    remove_column :photos, :artist_id, :bigint
  end
end
