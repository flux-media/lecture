class AdminController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def index
    render 'admin/index'
  end
end
