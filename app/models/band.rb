class Band < ApplicationRecord
  searchkick word_start: [:name]
  has_many :albums, dependent: :nullify
  # has_many :songs
  has_many :bandmembers, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :artists, through: :bandmembers
  belongs_to :category, optional: true

  def search_data
    {
      name: name
    }.merge(search_albums)
  end

  def search_albums
    {
      album_names: albums.map(&:name)
    }
  end
end
# Band.reindex
