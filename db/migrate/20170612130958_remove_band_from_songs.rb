class RemoveBandFromSongs < ActiveRecord::Migration[5.1]
  def change
   remove_column :songs , :band_id
  end
end
