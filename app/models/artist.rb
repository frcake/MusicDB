class Artist < ApplicationRecord
  has_many :bandmembers
  has_many :bands , through: :bandmembers
end
