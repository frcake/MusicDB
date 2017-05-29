class Category < ApplicationRecord
  acts_as_nested_set
  has_many :albums
  has_many :artists
  has_many :songs
  has_many :bands
end
