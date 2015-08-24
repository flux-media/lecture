class Admin::RegistrationsController < ApplicationController
  before_action :check_admin

  def create
    course_schedule = CourseSchedule.find(params[:course_schedule_id])
    user = User.find_by_email(params[:user_email])

    if course_schedule.nil? || user.nil?
      # Wrong course schedule or email
    else
      if user.student.nil?
        user.student = Student.new
        user.student.save
      end

      registration = Registration.has_duplicate(course_schedule.id, user)
      if registration.nil?
        registration = Registration.new
        registration.course_schedule = course_schedule
        registration.student = user.student
        registration.save
      end
    end

    redirect_to edit_admin_course_schedule_path(course_schedule.id)
  end

  def destroy
    course_schedule = CourseSchedule.find(params[:course_schedule_id])
    registration = Registration.find(params[:id])

    if course_schedule.nil? || registration.nil?
      # Wrong course schedule or registration!
    else
      if registration.destroy
        redirect_to edit_admin_course_schedule_path(course_schedule.id)
      end
    end
  end
end
