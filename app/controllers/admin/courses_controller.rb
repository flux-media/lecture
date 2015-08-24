class Admin::CoursesController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    course = Course.new(course_params)
    course.program = Program.find(params[:program])

    if course.save
      redirect_to edit_admin_course_path course.id
    end
  end

  def destroy
    course = Course.find(params[:id])

    if course != nil && course.destroy
      redirect_to admin_courses_path
    end
  end

  def edit
    @course = Course.find(params[:id])
    teachers = Teacher.all
    teachers_options = Array.new
    orders_array = Array.new
    (0..@course.lessons.size - 1).each do |i|
      orders_array.push(i)
    end

    if @course.lessons.size > 0
      @course.lessons.each do |lesson|
        teachers_option = ''
        teachers.each do |teacher|
          selected_attribute = ''
          if lesson.teacher.id === teacher.id
            selected_attribute = ' selected="selected"'
          end
          teachers_option += '<option value="' + teacher.id.to_s + '"' + selected_attribute + '>' +
              teacher.user.name + '('+ teacher.user.email + ')</option>'

        end
        teachers_options.push(teachers_option)
      end
    else
      teachers_option = ''
      teachers.each do |teacher|
        teachers_option += '<option value="' + teacher.id.to_s + '">' +
            teacher.user.name + '('+ teacher.user.email + ')</option>'
      end
      teachers_options.push(teachers_option)
    end

    render template: 'admin/courses/new',
           :locals => {:action => 'update',
                       :teachers_options => teachers_options,
                       :orders_array => orders_array,
                       :programs => Program.all}
  end

  def index
    @courses = Course.all

    @courses.each do |course|
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

  def new
    @course = Course.new
    render :locals => {:action => 'create',
                       :programs => Program.all}
  end

  def update
    course = Course.find(params[:course][:id])
    course.name = params[:course][:name]
    course.program = Program.find(params[:program])
    course.detail = params[:course][:detail]

    if !params[:delete_thumbnail].nil? && params[:delete_thumbnail].to_i === 1
      course.thumbnail = params[:course][:thumbnail]
    end

    if course.save
      redirect_to edit_admin_course_path course.id
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :thumbnail)
  end
end
