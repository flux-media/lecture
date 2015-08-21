require 'mailgun'

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
    result['data'] = Hash.new

    user = User.find_by_email(email)
    if user.nil?
      result['data']['title'] = t('error')
      result['data']['text'] = t('no_email_exists')
      result['data']['type'] = 'error'
      result['data']['confirmButtonText'] = t('confirm')
    else
      tokens = ResetPasswordToken.where(:user_id => user.id, :expired => false)

      unless tokens.nil?
        tokens.update_all(:expired => true)
      end

      token = ResetPasswordToken.new
      token.key = SecureRandom.hex(32)
      token.user = user
      if token.save
        # First, instantiate the Mailgun Client with your API key
        mg_client = Mailgun::Client.new(Rails.application.secrets.mailgun_key, 'bin.mailgun.net', '97d74c4f', ssl = false)

        # Define your message parameters
        html_body = render_to_string template: 'user_mailer/reset_password',
                                     :layout => false,
                                     :locals => {user: user,
                                                 url: 'http://localhost:3000/sessions/new_from_token/' +
                                                     user.id.to_s + '/' + token.key.to_s}

        text_body = render_to_string template: 'user_mailer/reset_password.text',
                                     :layout => false,
                                     :locals => {user: user,
                                                 url: 'http://localhost:3000/sessions/new_from_token/' +
                                                     user.id.to_s + '/' + token.key.to_s}

        message_params = {:from => 'master@sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org',
                          :to => user.email,
                          :subject => t('title_reset_password'),
                          :text => text_body.to_str,
                          :html => html_body.to_str}

        # Send your message through the client
        mg_client.send_message 'sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org', message_params

        result['result'] = 0
        result['data']['title'] = t('success')
        result['data']['text'] = t('check_email')
        result['data']['type'] = 'success'
        result['data']['confirmButtonText'] = t('confirm')
      else
        result['data']['title'] = t('error')
        result['data']['text'] = t('database_error')
        result['data']['type'] = 'error'
        result['data']['confirmButtonText'] = t('confirm')
      end
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
