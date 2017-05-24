class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :firstname
      t.string :lastname
      t.string :country
      t.text :description
      t.timestamps

    end
  end
end
