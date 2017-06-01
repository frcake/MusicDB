class RemoveGenreFromBands < ActiveRecord::Migration[5.1]
  def change
    remove_column :bands, :genre, :string
  end
end
