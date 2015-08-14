class Registration < ActiveRecord::Base
  belongs_to :course_schedule
  belongs_to :student

  def self.has_duplicate(course_schedule_id, user)
    if user.nil? || user.student.nil?
      nil
    else
      Registration.find_by(:student_id => user.student.id,
                           :course_schedule => course_schedule_id)
    end
  end
end
