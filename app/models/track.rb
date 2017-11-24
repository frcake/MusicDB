class Track < ApplicationRecord
  belongs_to :album
  belongs_to :song

  # validation
  validates  :album_id, presence: true
  validates  :song_id, presence: true
end
