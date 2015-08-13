class Program < ActiveRecord::Base
	attr_accessor :style_class

	belongs_to :category
	has_and_belongs_to_many :courses
	has_many :lessons
end
