class Admin::LessonSchedulesController < ApplicationController
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
    begin
      lesson_schedule.held_at = DateTime.strptime(
          params[:held_at], t('simple_datetime'))
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
