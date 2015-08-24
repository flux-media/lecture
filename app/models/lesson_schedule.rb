class LessonSchedule < ActiveRecord::Base
  belongs_to :course_schedule
  belongs_to :lesson
  belongs_to :location
end
