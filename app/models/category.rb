class Category < ActiveRecord::Base
  has_many :categories_courses
  has_many :courses, through: :categories_courses
end
