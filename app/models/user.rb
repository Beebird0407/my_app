class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP},
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
  has_many :values, dependent: :destroy
  # todo: validations
end
