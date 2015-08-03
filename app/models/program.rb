class Program < ActiveRecord::Base
	attr_accessor :style_class

	has_and_belongs_to_many :courses
	has_many :lessons
end
