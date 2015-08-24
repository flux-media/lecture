class Student < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	has_many :registrations
end
