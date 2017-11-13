class Band < ApplicationRecord
  searchkick word_start: [:name]
  has_many :albums, dependent: :nullify
  # has_many :songs
  has_many :bandmembers, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :artists, through: :bandmembers
  belongs_to :category, optional: true
end
Band.reindex
