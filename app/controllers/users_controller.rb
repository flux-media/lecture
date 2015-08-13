class UsersController < ApplicationController
  before_action :check_admin, only: [:index, :delete]

  def create
    if is_admin
      user = User.new
      user.name = params[:user][:name]
      user.email = params[:user][:email]
      user.password = params[:password]
      user.is_admin = params[:user][:is_admin]
    else
      user = User.new(user_params)
    end
    student = Student.new
    user.student = student
    if user.save
      if is_admin
        redirect_to admin_user_path
      else
        session[:user_id] = user.id
        redirect_to root_path
      end
    else
      redirect_to signup_path
    end
  end

  def delete
    user = User.find(params[:id])

    if user != nil
      # If there's only one remaining admin User, don't delete it.
      if (user.is_admin && User.where(is_admin: true).count === 1) ||
          # If the user deletes itself, don't do it.
          params[:id] === current_user.id
        # Do nothing.
      else
        user.destroy
      end
    end

    redirect_to admin_user_path
  end

  def edit
    if is_admin
      @user = User.find(params[:id])
      render template: 'users/admin_new',
             :layout => 'admin',
             :locals => {:action => 'update'}
    else
      render nothing: true
    end
  end

  def new
    if is_admin
      @user = User.new
      render template: 'users/admin_new',
             :layout => 'admin',
             :locals => {:action => 'create'}
    else
      @is_banner_visible = true
    end
  end

  def index
    @users = User.all
    render template: 'users/index', :layout => 'admin'
  end

  def show
    @user = User.find(params[:user_id])
  end

  def update
    user = User.find(params[:user][:id])
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

    if params[:user][:is_teacher] == 'true'
      if user.teacher.nil?
        user.teacher = Teacher.new
      end

      user.teacher.description = params[:teacher_description]

      if user.teacher.save
        # Good!
      end
    else
      unless user.teacher.nil?
        if user.teacher.destroy
          # Good!
        end
      end
    end

    if params[:user][:is_student] == 'true'
      if user.student.nil?
        user.student = Student.new
      end

      if user.student.save
        # Good!
      end
    else
      unless user.student.nil?
        if user.student.destroy
          # Good!
        end
      end
    end

    if user.save
      redirect_to admin_edit_user_path user.id
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
