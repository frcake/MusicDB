class AddCategoryToArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :artists, :category, foreign_key: true
  end
end
