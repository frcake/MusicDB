class Category < ApplicationRecord
  acts_as_nested_set
  has_many :albums, dependent: :nullify
  has_many :artists, dependent: :nullify
  has_many :songs, dependent: :nullify
  has_many :bands, dependent: :nullify
  searchkick word_start: [:name]
  def search_data
    {
      name: name
    }.merge(search_children)
  end

  def search_children
    {
      band_names: bands.map(&:name),
      album_names: albums.map(&:name)
    }
  end
end
# Category.reindex
