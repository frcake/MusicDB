class Track < ApplicationRecord
  belongs_to :album
  belongs_to :song

  # validation
  validates :name, album_id: true
  validates :name, song_id: true
end
