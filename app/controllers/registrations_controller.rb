class RegistrationsController < ApplicationController
  def create
    course = Course.find(params[:course_id])

    if course.nil?
      # TODO: Wrong course!
      return
    elsif current_user.nil?
      redirect_to login_path(:target => course_path(course.id))
    else
      open_course_schedule = nil
      course.course_schedules.each do |course_schedule|
        if course_schedule.lesson_schedules.last.held_at > DateTime.now
          if open_course_schedule.nil?
            open_course_schedule = course_schedule
          end
        else
        end
      end

      if open_course_schedule.nil?
        # TODO: No open course exists!
        return
      end

      registration = Registration.has_duplicate(
          open_course_schedule.id, current_user)
      if registration.nil?
        registration = Registration.new
        registration.course_schedule_id = open_course_schedule.id
        registration.student_id = current_user.student.id
        if registration.save
          payment = Payment.new
          payment.user = current_user
          payment.registration = registration
          payment.amount = 0
          payment.point = -1
          payment.payment_state = PaymentState.find_by_key('completed')
          if payment.save

          end
        end
      end

      redirect_to course_path(course.id)
    end
  end

  def destroy
    registration = Registration.find(params[:id])
    course = Course.find(params[:course_id])

    if course.nil? || registration.nil?
      # TODO: Wrong course or registration!
      return
    elsif current_user.nil?
      redirect_to login_path(:target => course_path(course.id))
    elsif current_user.student.id != registration.student.id
      # TODO: Wrong user attempts to delete this registration!
    else
      if registration.destroy
        payment = Payment.where(user_id: current_user.id, registration_id: registration.id).first
        if !payment.nil? && payment.destroy
          redirect_to course_path(course.id)
        end
      end
    end
  end
end
