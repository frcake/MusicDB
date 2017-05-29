class Band < ApplicationRecord
  has_many :albums
  has_many :songs
  has_many :bandmembers
  has_many :photos,as: :imageable, dependent: :destroy
  has_many :artists , through: :bandmembers
end
