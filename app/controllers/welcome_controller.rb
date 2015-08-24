class WelcomeController < ApplicationController
  def index
    @is_banner_visible = true

    courses = Course.all
    courses_1 = Array.new
    courses_2 = Array.new
    courses_3 = Array.new

    courses.each_with_index do |course, index|
      teachers_array = Array.new

      course.lessons.each do |lesson|
        teacher = lesson.teacher

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

      course.teachers = teachers_array

      case (index % 3)
        when 0
          courses_1.push(course)
        when 1
          courses_2.push(course)
        when 2
          courses_3.push(course)
        else
      end
    end

    render :locals => {
               courses_1: courses_1,
               courses_2: courses_2,
               courses_3: courses_3}
  end
end
