class RegistrationsController < ApplicationController
  def create
    course_id = params[:course_id]

    if current_user == nil
      redirect_to login_path(:target => course_path(course_id))
    else
      # Check duplicates.
      registration = Registration.has_duplicate(course_id, current_user)
      if registration == nil
        registration = Registration.new
        registration.course_id = course_id
        registration.student_id = current_user.student.id
        registration.save
      end

      redirect_to course_path course_id
    end
  end

  def delete
    course_id = params[:course_id]

    if current_user != nil
      registration = Registration.has_duplicate(course_id, current_user)
      if registration == nil
        redirect_to course_path course_id
      else
        registration.destroy
      end
    end

    if is_admin
      redirect_to admin_edit_course_path course_id
    else
      redirect_to course_path course_id
    end
  end
end
