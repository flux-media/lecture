class Course < ActiveRecord::Base
	attr_accessor :teachers

	belongs_to :program
	has_many :lessons
	has_many :students
	has_many :registrations
end
