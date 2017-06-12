class Photo < ApplicationRecord
  #belongs_to :album, inverse_of: :photos
  belongs_to :imageable , polymorphic: true
  #belongs_to :artist,inverse_of: :photos
  has_attached_file :image, styles: { large: "600x600",medium: "400x400>", thumb: "120x240>" }, default_url: 'missing/no-image.png'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
end
