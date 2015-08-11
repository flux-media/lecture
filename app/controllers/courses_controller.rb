class CoursesController < ApplicationController
  before_action :check_admin, :only => :index

  def create
    course = Course.new
    course.name = params[:course][:name]
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
    render template: 'courses/new',
           :layout => 'admin',
           :locals => {:action => 'Update'}
  end

  def index
    @courses = Course.all
    render template: 'courses/index', :layout => 'admin'
  end

  def new
    @course = Course.new
    render :layout => 'admin',
           :locals => {:action => 'Create'}
  end

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

  def update
    course = Course.find(params[:course][:id])
    course.name = params[:course][:name]
    if course.save
      redirect_to admin_edit_course_path course.id
    end
  end
end
