class RemoveGenreFromSongs < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :genre, :string
  end
end
