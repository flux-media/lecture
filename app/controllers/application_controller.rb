class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  attr_accessor :is_banner_visible
  before_action :set_configs
  helper_method :current_user, :is_admin

  def check_admin
    unless is_admin
      redirect_to new_admin_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
    current_user != nil && current_user.is_admin === true
  end

  def set_configs
    @admin_config = AdminConfig.first
  end
end
