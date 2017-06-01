class Artist < ApplicationRecord
  has_many :bandmembers
  has_many :photos,as: :imageable, dependent: :destroy
  has_many :bands , through: :bandmembers
  belongs_to :category,optional: true

  def self.artists_mapping
    all.collect {|u| ["#{u.firstname} #{u.lastname}", u.id]}
  end
end
