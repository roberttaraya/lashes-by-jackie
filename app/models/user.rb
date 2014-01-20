class User < ActiveRecord::Base
  has_many :appointments

  before_save { self.email = email.downcase }
  # validates :first_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
end
