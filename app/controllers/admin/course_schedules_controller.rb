class Admin::CourseSchedulesController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    course_schedule = CourseSchedule.new

    course = Course.find(params[:course])
    course_schedule.order = CourseSchedule.where(
        :course_id => course.id).size + 1
    course_schedule.course = Course.find(course)

    if course_schedule.save
      redirect_to admin_course_schedules_path
    end
  end

  def destroy
    course_schedule = CourseSchedule.find(params[:id])

    if course_schedule != nil && course_schedule.destroy
      redirect_to admin_course_schedules_path
    end
  end

  def edit
    @course_schedule = CourseSchedule.find(params[:id])
    render :template => 'admin/course_schedules/new',
           :locals => {
               action: 'update',
               courses: Course.all,
               locations: Location.all,
               url: edit_admin_course_schedule_path(@course_schedule)}
  end

  def index
    @course_schedules = CourseSchedule.all
  end

  def new
    @course_schedule = CourseSchedule.new
    render :locals => {
               action: 'create',
               courses: Course.all,
               locations: Location.all,
               url: admin_course_schedules_path}
  end
end
