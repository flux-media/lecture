class CourseSchedulesController < ApplicationController
  def create
    course_schedule = CourseSchedule.new
    course_schedule.order = CourseSchedule.where(:course_id => params[:course_id]).size + 1
    course_schedule.course = Course.find(params[:course_id])

    if course_schedule.save
      # Success!
    end
  end

  def delete
    course_schedule = CourseSchedule.find(params[:id])

    if course_schedule.destroy
      # Success!
    end
  end
end
