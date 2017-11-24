class Artist < ApplicationRecord
  has_many :albums, dependent: :nullify
  has_many :bandmembers, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :bands, through: :bandmembers
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :category_id, presence: true
  validates :photos, presence: true
end
