class Category < ActiveRecord::Base
  attr_accessor :courses_count

  has_many :programs
end
