class Artist < ApplicationRecord
  has_many :bandmembers
  has_many :photos,as: :imageable, dependent: :destroy
  has_many :bands , through: :bandmembers
end
