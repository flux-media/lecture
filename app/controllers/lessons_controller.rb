class LessonsController < ApplicationController
  before_action :check_admin

  def create
    lesson = Lesson.new
    lesson.name = params[:lesson][:name]
    if lesson.save
      redirect_to admin_lesson_path
    end
  end

  def delete
    lesson = Lesson.find(params[:id])
    if lesson != nil
      lesson.destroy
    end

    redirect_to admin_lesson_path
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render template: 'lessons/new',
           :layout => 'admin',
           :locals => {:action => 'Update'}
  end

  def index
    @lessons = Lesson.all
    render template: 'lessons/index', :layout => 'admin'
  end

  def new
    @lesson = Lesson.new
    render :layout => 'admin',
           :locals => {:action => 'Create'}
  end

  def update
    lesson = Lesson.find(params[:lesson][:id])
    lesson.name = params[:lesson][:name]
    if lesson.save
      redirect_to admin_edit_lesson_path lesson.id
    end
  end

end
