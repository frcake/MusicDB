class Album < ApplicationRecord
  has_many :songs
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
end
