class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      student = Student.new
      user.student = student
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

  def edit
    render nothing: true
  end

  def new
    if current_user
      redirect_to user_path current_user
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
