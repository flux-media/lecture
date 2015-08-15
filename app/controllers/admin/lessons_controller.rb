class Admin::LessonsController < ApplicationController
  before_action :check_admin

  def create
    lesson = Lesson.new
    lesson.name = params[:lesson][:name]
    lesson.teacher = Teacher.find(params[:teacher])
    lesson.order = params[:order]
    lesson.course = Course.find(params[:course_id])

    if lesson.save
      redirect_to edit_admin_course_path lesson.course_id
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    course_id = lesson.course_id
    if lesson != nil
      if lesson.destroy
        redirect_to edit_admin_course_path course_id
      end
    end
  end

  def update
    lesson = Lesson.find(params[:id])
    lesson.name = params[:lesson][:name]
    lesson.teacher = Teacher.find(params[:teacher])
    lesson.order = params[:order]
    lesson.course = Course.find(params[:course_id])

    if lesson.save
      redirect_to edit_admin_course_path lesson.course_id
    end
  end
end
