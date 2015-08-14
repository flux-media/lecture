class CoursesController < ApplicationController
  before_action :check_admin,
                :only => [:create, :delete, :edit, :new, :update]

  def create
    course = Course.new
    course.name = params[:course][:name]
    course.program = Program.find(params[:program])

    if course.save
      redirect_to admin_course_path
    end
  end

  def delete
    course = Course.find(params[:id])
    if course != nil
      course.destroy
    end

    redirect_to admin_course_path
  end

  def edit
    @course = Course.find(params[:id])
    teachers = Teacher.all
    teachers_options = Array.new
    orders_array = Array.new
    (0..@course.lessons.size - 1).each { |i|
      orders_array.push(i)
    }

    @course.lessons.each do |lesson|
      teachers_option = ''
      teachers.each do |teacher|
        if lesson.teacher.id === teacher.id
          selected = ' selected="selected"'
        else
          selected = ''
        end
        teachers_option += '<option value="' + teacher.id.to_s + '"' + selected + '>' +
            teacher.user.name + '('+ teacher.user.email + ')</option>'
      end
      teachers_options.push(teachers_option)
    end

    render template: 'courses/new',
           :layout => 'admin',
           :locals => {:action => 'update',
                       :teachers_options => teachers_options,
                       :orders_array => orders_array,
                       :programs => Program.all}
  end

  def index
    if is_admin
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

      render template: 'courses/admin_index', :layout => 'admin'
    else
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
  end

  def new
    @course = Course.new
    render :layout => 'admin',
           :locals => {:action => 'create',
                       :programs => Program.all}
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

  def update
    course = Course.find(params[:course][:id])
    course.name = params[:course][:name]
    course.program = Program.find(params[:program])

    if course.save
      redirect_to admin_edit_course_path course.id
    end
  end
end
