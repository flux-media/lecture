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

  def reset_password
    email = params[:email]
    result = Hash.new
    result['result'] = 1

    user = User.find_by_email(email)
    unless user.nil?
      tokens = ResetPasswordToken.where(:user_id => user.id, :expired => false)

      unless tokens.nil?
        tokens.update_all(:expired => true)
      end

      token = ResetPasswordToken.new
      token.key = SecureRandom.hex(32)
      token.user = user
      if token.save
        result['result'] = 0
      end
      UserMailer.reset_password(user).deliver_now
    end

    render json: result
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
