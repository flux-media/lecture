class CourseSchedule < ActiveRecord::Base
  belongs_to :course

  has_many :lesson_schedules, -> {order(:held_at)}
  has_many :registrations
end
