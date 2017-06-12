class Artist < ApplicationRecord
  has_many :bandmembers , dependent: :destroy
  has_many :photos,as: :imageable, dependent: :destroy
  has_many :bands , through: :bandmembers
  belongs_to :category,optional: true

  end
