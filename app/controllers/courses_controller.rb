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
    @course = Course.find(params[:id])
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
      registration_path = course_path(@course.id) +'/register'
    else
      registration_path = login_path(:target => course_path(@course.id))
    end

    is_course_open = false
    displayable_course_schedule = nil
    @course.course_schedules.each do |course_schedule|
      if course_schedule.lesson_schedules.last.held_at > DateTime.now
        is_course_open = true
        if displayable_course_schedule.nil?
          displayable_course_schedule = course_schedule
        end
      else
        is_course_open = false
      end
    end

    if displayable_course_schedule.nil?
      displayable_course_schedule = @course.course_schedules.last
    end

    registration = Registration.has_duplicate(
        displayable_course_schedule.nil? ? nil :
            displayable_course_schedule.id, current_user)

    render :locals => {
               displayable_course_schedule: displayable_course_schedule,
               registration_path: registration_path,
               is_course_open: is_course_open,
               registration: registration}
  end
end
