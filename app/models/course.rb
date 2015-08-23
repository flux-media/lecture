class Course < ActiveRecord::Base
  attr_accessor :teachers

  belongs_to :program
  has_many :course_schedules
  has_many :lessons, -> { order(:order) }
end
