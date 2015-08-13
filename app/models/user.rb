class User < ActiveRecord::Base
	has_secure_password

	has_one :student
	has_one :teacher

  attr_accessor :is_teacher, :is_student

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
