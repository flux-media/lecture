class User < ActiveRecord::Base
  has_secure_password

  has_many :reset_password_tokens, :dependent => :destroy

  validates :email, :presence => true, :email => true, :uniqueness => true
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :password_digest, :presence => true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
