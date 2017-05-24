class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.belongs_to :album,index: true
      t.belongs_to :artist,index: true
      t.timestamps
    end
  end
end
