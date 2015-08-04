class Registration < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  def self.has_duplicate(course_id, user)
    if user == nil
      nil
    else
      Registration.find_by(:student_id => user.student.id,
                           :course_id => course_id)
    end
  end
end
