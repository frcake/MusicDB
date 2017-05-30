class Album < ApplicationRecord
  has_many :songs
  has_many :photos,as: :imageable, dependent: :destroy
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
  belongs_to :category, optional: true

  #validation
  validates :name , presence: true
  #validates :release_date, presence: true

end
