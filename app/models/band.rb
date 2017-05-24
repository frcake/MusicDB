class Band < ApplicationRecord
  has_many :albums,:songs,:bandmembers
  has_many :artists , through: :bandmembers
end
