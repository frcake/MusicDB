class RemoveColumnsFromArtists < ActiveRecord::Migration[5.1]
  def change
   remove_column :artists , :firstname
   remove_column :artists , :lastname
  end
end
