class Category < ApplicationRecord
  acts_as_nested_set
  has_many :albums , dependent: :nullify
  has_many :artists, dependent: :nullify
  has_many :songs, dependent: :nullify
  has_many :bands, dependent: :nullify
end
