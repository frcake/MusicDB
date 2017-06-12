class Band < ApplicationRecord
  has_many :albums
  #has_many :songs
  has_many :bandmembers , dependent: :destroy
  has_many :photos,as: :imageable, dependent: :destroy
  has_many :artists , through: :bandmembers
  belongs_to :category, optional: true
end
