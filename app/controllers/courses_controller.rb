class CoursesController < ApplicationController
  def show
    @is_banner_visible = true

    course_id = params[:course_id]
    @course = Course.find(course_id)
    teachers_array = Array.new

    @course.lessons.each do |lesson|
      lesson.teachers.each do |teacher|

        is_in_array = false

        teachers_array.each do |teacher_in_array|
          if teacher_in_array.id === teacher.id
            is_in_array = true
          end
        end

        unless is_in_array
          teachers_array.push(teacher)
        end

      end
    end

    @course.teachers = teachers_array

    if current_user
      @registration_path = course_path(@course.id) +'/register'
    else
      @registration_path = login_path(:target => course_path(@course.id))
    end

    @is_registration_possible = Registration.has_duplicate(
        @course.id, current_user).nil?
  end
end
