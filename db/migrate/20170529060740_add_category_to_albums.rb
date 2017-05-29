class AddCategoryToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :category, foreign_key: true
  end
end
