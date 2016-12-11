class WelcomeController < ApplicationController
  def index
    @is_banner_visible = true

    courses = Course.all
    courses_1 = Array.new
    courses_2 = Array.new
    courses_3 = Array.new

    courses.each_with_index do |course, index|
      case (index % 3)
        when 0
          courses_1.push(course)
        when 1
          courses_2.push(course)
        when 2
          courses_3.push(course)
        else
      end
    end

    render :locals => {courses_1: courses_1, courses_2: courses_2, courses_3: courses_3}
  end

  def not_found
    render_error 404
  end

  def unacceptable
    render_error 422
  end

  def internal_error
    render_error 500
  end

  private

  def render_error(code)
    case code
      when 404
        code_status = t('not_found')
      when 422
        code_status = t('not_authorized')
      when 500
        code_status = t('server_error')
      else
        code_status = t('server_error')
    end

    respond_to do |format|
      format.html { render template: 'welcome/error',
                           layout: 'application',
                           locals: {
                               code: code,
                               code_status: code_status},
                           status: code }
    end
  end
end
