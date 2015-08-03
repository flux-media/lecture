class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    student = Student.new()
    user.student = student
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def new

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
