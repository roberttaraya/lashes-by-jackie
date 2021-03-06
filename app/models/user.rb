class User < ActiveRecord::Base
  has_many :appointments

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  # validates :first_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :first_name,  presence: true,
                          length: { minimum: 2 }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password

  attr_accessible :first_name, :last_name, :cell_phone, :email, :password, :password_confirmation

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.by_last_initial(letter)
    where("last_name LIKE ?", "#{letter.upcase}%").order(:last_name)
  end

  def name
    [first_name, last_name].join(" ")
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
