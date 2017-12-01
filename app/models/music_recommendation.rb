class MusicRecommendation < ApplicationRecord
  belongs_to :user

  serialize :recommendation, Array
end
