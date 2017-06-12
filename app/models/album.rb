# require 'elasticsearch/model'
class Album < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick word_start: [:name]
  has_many :tracks , dependent: :destroy
  has_many :songs , through: :tracks
  has_many :photos,as: :imageable, dependent: :destroy
  belongs_to :band, optional: true
  belongs_to :artist, optional: true
  belongs_to :category, optional: true

  #validation
  validates :name , presence: true
  #validates :release_date, presence: true

  # mapping do
  #   indexes :name , :type => "string", analyzer:   "index_ngram_analyzer", search_analyzer: "search_ngram_analyzer"
  # end

end
#Album.reindex
# begin
#   Album.__elasticsearch__.client.indices.delete index: Album.index_name
# rescue
#   nil
# end
#
# Album.__elasticsearch__.client.indices.create \
#  index: Album.index_name,
# body: { settings: Album.settings.to_hash,mappings: Album.mappings.to_hash}
# Album.import force:true
