class LessonsController < ApplicationController
  before_action :check_admin

  def create
    if params[:lesson] != nil && params[:lesson][:id] != nil
      lesson = Lesson.find_by(params[:lesson][:id])
    else
      lesson = Lesson.new
    end
    lesson.name = params[:lesson][:name]
    lesson.teacher = Teacher.find(params[:teacher])
    lesson.order = params[:order]
    lesson.course = Course.find(params[:course_id])

    if lesson.save
      redirect_to admin_edit_course_path lesson.course_id
    end
  end

  def delete
    lesson = Lesson.find(params[:id])
    course_id = lesson.course_id
    if lesson != nil
      if lesson.destroy
        redirect_to admin_edit_course_path course_id
      end
    end
  end
end
