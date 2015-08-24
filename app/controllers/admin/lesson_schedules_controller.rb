class Admin::LessonSchedulesController < ApplicationController
  before_action :check_admin

  def update
    lesson_schedule = LessonSchedule.where(
        lesson_id: params[:lesson_id],
        course_schedule_id: params[:course_schedule_id]).first

    if lesson_schedule.nil?
      lesson_schedule = LessonSchedule.new
      lesson_schedule.lesson = Lesson.find(params[:lesson_id])
      lesson_schedule.course_schedule = CourseSchedule.find(
          params[:course_schedule_id])
    end
    lesson_schedule.location = Location.find(params[:location])
    begin
      lesson_schedule.held_at = Time.zone.parse(params[:held_at])
      if lesson_schedule.save
        redirect_to edit_admin_course_schedule_path(
                        params[:course_schedule_id])
      end
    rescue ArgumentError
      # TODO: DateTime format is invalid!
      redirect_to edit_admin_course_schedule_path(
                      params[:course_schedule_id])
    end
  end
end
