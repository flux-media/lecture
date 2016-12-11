class Admin::CoursesController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    course = Course.new(course_params)
    redirect_to edit_admin_course_path course.id if course.save
  end

  def destroy
    course = Course.find(params[:id])
    redirect_to admin_courses_path if course != nil && course.destroy
  end

  def edit
    @course = Course.find(params[:id])
    render template: 'admin/courses/new', :locals => {action: 'update',
                                                      categories: Category.all}
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    render :locals => {action: 'create',
                       categories: Category.all}
  end

  def update
    course = Course.find(params[:course][:id])
    course.title = params[:course][:title]
    course.slug = params[:course][:slug]
    course.date = params[:course][:date]
    course.location = params[:course][:location]
    course.is_public = params[:course][:is_public]
    course.is_on_sale = params[:course][:is_on_sale]
    course.is_full = params[:course][:is_full]
    course.is_past = params[:course][:is_past]
    course.max_students = params[:course][:max_students]
    course.students_enrolled = params[:course][:students_enrolled]
    course.duration = params[:course][:duration]
    course.original_price = params[:course][:original_price]
    course.sale_price = params[:course][:sale_price]
    course.summary = params[:course][:summary]
    course.detail = params[:course][:detail]

    if !params[:delete_thumbnail].nil? && params[:delete_thumbnail].to_i === 1
      course.thumbnail = params[:course][:thumbnail]
    end

    redirect_to edit_admin_course_path course.id if course.save
  end

  private

  def course_params
    params.require(:course).permit(:name, :thumbnail)
  end
end
