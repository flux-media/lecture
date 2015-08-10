class AdminController < ApplicationController
  layout 'admin'

  def index
    render is_admin ? 'admin/index' : 'admin/login'
  end
end
