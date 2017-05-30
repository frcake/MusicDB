class AddBandToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :band, foreign_key: true
  end
end
