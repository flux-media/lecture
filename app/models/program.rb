class Program < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :lessons
end
