class CoursesController < ApplicationController
  def index
    @categories = Category.all

    @categories.each do |category|
      courses_count = 0
      category.programs.each do |program|
        program.courses.each do |course|
          courses_count += 1
          teachers_array = Array.new

          course.lessons.each do |lesson|
            is_in_array = false
            teacher = lesson.teacher

            teachers_array.each do |teacher_in_array|
              if teacher_in_array.id === teacher.id
                is_in_array = true
              end
            end

            unless is_in_array
              teachers_array.push(teacher)
            end
          end

          course.teachers = teachers_array
        end
      end

      category.courses_count = courses_count
    end

    render template: 'courses/index'
  end

  def show
    @is_banner_visible = true

    course_id = params[:course_id]
    @course = Course.find(course_id)
    teachers_array = Array.new

    @course.lessons.each do |lesson|
      is_in_array = false
      teacher = lesson.teacher

      teachers_array.each do |teacher_in_array|
        if teacher_in_array.id === teacher.id
          is_in_array = true
        end
      end

      unless is_in_array
        teachers_array.push(teacher)
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
