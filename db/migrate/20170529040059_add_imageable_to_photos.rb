class AddImageableToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :imageable, polymorphic: true
  end
end
