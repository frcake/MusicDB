class Album < ApplicationRecord
  searchkick word_start: [:name]
  has_many :tracks, dependent: :destroy
  has_many :songs, through: :tracks
  has_many :photos, as: :imageable, dependent: :destroy
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
  belongs_to :category, optional: true

  has_many :record_libraries
  has_many :users, through: :record_libraries

  # validation
  validates :name, presence: true
  # validates :release_date, presence: true

  # paginates_per 25
end
# Album.reindex
