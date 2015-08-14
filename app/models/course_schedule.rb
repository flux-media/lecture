class CourseSchedule < ActiveRecord::Base
  belongs_to :course

  has_many :registrations
end
