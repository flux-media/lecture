class Admin::UsersController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    user = User.new
    create_or_update_user user, params
  end

  def destroy
    user = User.find(params[:id])

    if user != nil
      # If there's only one remaining admin User, don't delete it.
      if (user.is_admin && User.where(is_admin: true).count === 1) ||
          # If the user deletes itself, don't do it.
          params[:id] === current_user.id
        # Do nothing.
      else
        if user.destroy
          # TODO: Delete every single records of this user.
        end
      end
    end

    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
    render :template => 'admin/users/new',
           :locals => {:action => 'update',
                       :url => admin_user_path(@user)}
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :locals => {:action => 'create',
                       :url => admin_users_path}
  end

  def update
    user = User.find(params[:user][:id])
    create_or_update_user user, params
  end

  private

  def create_or_update_user(user, params)
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    if params[:password] != nil
      user.password = params[:password]
    end

    # If there's only one remaining admin User,
    # don't update it to false.
    if user.is_admin && User.where(is_admin: true).count === 1 &&
        params[:user][:is_admin] == 'false'
      # Do nothing.
    else
      user.is_admin = params[:user][:is_admin]
    end

    redirect_to admin_users_path if user.save
  end
end
