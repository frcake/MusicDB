class Song < ApplicationRecord
  belongs_to :album,:band,:artist
end
