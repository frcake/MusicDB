class CreateMusicRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :music_recommendations do |t|
      t.belongs_to :user, optional: true # , foreign_key: true
      t.text :recommendation

      t.timestamps
    end
  end
end
