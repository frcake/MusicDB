class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_one :user_vector
  has_one :music_recommendation
  # this is to be able to see followed by
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :record_libraries
  has_many :albums, through: :record_libraries

  accepts_nested_attributes_for :user_vector

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
                    # format: { with: VALID_EMAIL_REGEX },t
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # Mailboxer
  acts_as_messageable

  def mailboxer_email(object)
    puts object
    email
end

  def name
    username
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(_tok)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
