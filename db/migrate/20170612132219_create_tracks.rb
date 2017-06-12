class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.references :album
      t.references :song
      t.timestamps
    end
  end
end
