class Album < ApplicationRecord
  has_many :songs
  has_many :photos, dependent: :destroy, inverse_of: :album
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
end
