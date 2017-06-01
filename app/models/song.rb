class Song < ApplicationRecord
  belongs_to :album
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
  belongs_to :category

  #validation
  # validates :name, presence: true
  # validates :genre, presence: true
  # validates :album_id, presence: true
  # validates :artist_id, presence: true
end
