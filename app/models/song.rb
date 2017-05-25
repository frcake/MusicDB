class Song < ApplicationRecord
  belongs_to :album
  belongs_to :band
  belongs_to :artist
end
