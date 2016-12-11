class Admin::TeachersController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    teacher = Teacher.new(teacher_params)

    redirect_to admin_teachers_path if teacher.save
  end

  def destroy
    teacher = Teacher.find(params[:id])

    if teacher != nil
      if teacher.destroy
        # TODO: Delete every single records of this teacher.
      end
    end
    redirect_to admin_teachers_path
  end

  def edit
    @teacher = Teacher.find(params[:id])
    render :template => 'admin/teachers/new',
           :locals => {:action => 'update',
                       :url => admin_teacher_path(@teacher)}
  end

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    render :locals => {:action => 'create',
                       :url => admin_teachers_path}
  end

  def update
    teacher = Teacher.find(params[:teacher][:id])
    teacher.name = params[:teacher][:name]
    teacher.blog_url = params[:teacher][:blog_url]
    teacher.facebook_url = params[:teacher][:facebook_url]
    teacher.twitter_id = params[:teacher][:twitter_id]
    teacher.description = params[:teacher][:description]

    if !params[:delete_thumbnail].nil? && params[:delete_thumbnail].to_i === 1
      teacher.thumbnail = params[:teacher][:thumbnail]
    end

    redirect_to admin_teachers_path if teacher.save
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :blog_url, :facebook_url, :twitter_id, :description, :thumbnail)
  end
end
