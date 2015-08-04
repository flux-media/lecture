class Course < ActiveRecord::Base
	attr_accessor :teachers

	has_and_belongs_to_many :programs
	has_many :lessons
	has_many :students
	has_many :registrations
end
