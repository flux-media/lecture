class LessonSchedule < ActiveRecord::Base
  belongs_to :course_schedule
  belongs_to :lesson
end
