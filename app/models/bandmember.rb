class Bandmember < ApplicationRecord
  belongs_to :artist
  belongs_to :band

  validates :artist_id, presence: true
  validates :band_id, presence: true
end
