class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new

  end

  def create
    user = User.find_by_email(params[:user][:email])

    if !user.nil? && user.is_admin &&
        user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    end

    redirect_to admin_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_path
  end
end
