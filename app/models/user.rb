class User < ActiveRecord::Base
  attr_accessor :is_teacher, :is_student
  has_secure_password

  has_one :student, :dependent => :destroy
  has_one :teacher, :dependent => :destroy

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
end
