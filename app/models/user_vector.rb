class UserVector < ApplicationRecord
  belongs_to :user

  def categories
    uc = user.user_vector.attributes.symbolize_keys.except(:id, :user_id, :dimensions, :created_at, :updated_at)
    uc.map { |_k, v| v }
  end
end
