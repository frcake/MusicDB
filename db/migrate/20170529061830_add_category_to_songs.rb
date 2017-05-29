class AddCategoryToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :category, foreign_key: true
  end
end
