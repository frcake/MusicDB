class User < ApplicationRecord

  before_save { self.email = email.downcase }
  validates :username, presence: true , length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
  #format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }


  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
