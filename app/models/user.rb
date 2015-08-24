class User < ActiveRecord::Base
  attr_accessor :is_teacher, :is_student, :credit
  has_secure_password

  has_one :student, :dependent => :destroy
  has_one :teacher, :dependent => :destroy
  has_many :reset_password_tokens, :dependent => :destroy
  has_many :payments, :dependent => :destroy

  validates :email, :presence => true, :email => true, :uniqueness => true
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :password_digest, :presence => true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def is_student
    !self.student.nil?
  end

  def is_teacher
    !self.teacher.nil?
  end

  def credit
    credit = Payment.where(
        user_id: self.id,
        payment_state_id: 2).group(:user_id).sum(:point)[self.id]
    if credit.nil?
      0
    else
      credit
    end
  end
end
