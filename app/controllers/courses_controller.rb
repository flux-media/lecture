class CoursesController < ApplicationController
  def index
    @categories = Category.all

    @categories.each do |category|
      courses_count = 0
      category.courses.each do |course|
        courses_count += 1
      end
      category.courses_count = courses_count
    end
  end

  def show
    @course = Course.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @course.detail = markdown.render(@course.detail)

    if current_user
      registration_path = course_path(@course.id) +'/register'
    else
      registration_path = login_path(:target => course_path(@course.id))
    end

    render :locals => {registration_path: registration_path}
  end
end
