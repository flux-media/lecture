class SessionsController < ApplicationController
  def create
    if params[:user].nil?
      redirect_to login_path
      return
    end

    begin
      email = params[:user][:email].squish
      password = params[:user][:password].squish

      user = User.find_by_email(email)
      if email.length > 0 && password.length > 0 &&
          !user.nil? && user.authenticate(password)
        session[:user_id] = user.id

        # For a nicer look of URL, strip off a leading '/'.
        target = params[:target]
        if target.nil?
          target = ''
        end
        if target.start_with?('/')
          target = target[1..-1]
        end
        redirect_to root_url + target
      else
        redirect_to login_path
      end
    rescue NoMethodError
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def new
    render :locals => {target: params[:target]}
  end

  def new_by_provider
    provider = params[:provider]
    token = params[:token]
    result = Hash.new
    result['result'] = 1
    result['data'] = Hash.new

    email = 'default_email'
    name = 'default_name'

    if provider === 'facebook'
      url = URI.parse('https://graph.facebook.com/v2.4/me?fields=id,name,email&access_token=' + URI.encode(token))
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Get.new(url.to_s)
      res = JSON(http.request(req).body)

      if res.has_key?('error')
        render json: result
        return
      else
        email = res['email'].squish
        name = res['name'].squish
      end
    end

    user = User.find_by_email(email)

    if user.nil?
      # No users found with the email. Create one.
      user = User.new
      user.email = email
      user.password = nil
      user.name = name
      if user.save
        student = Student.new
        user.student = student
      else
        render json: result
        return
      end
    end

    session[:user_id] = user.id

    # For a nicer look of URL, strip off a leading '/'.
    target = params[:target]
    if target.nil?
      target = ''
    else
      if target.start_with?('/')
        target = target[1..-1]
      end
    end

    result['result'] = 0
    result['data']['redirect_url'] = root_url + target

    render json: result
  end

  def new_from_token
    user_id = params[:user_id]
    token = ResetPasswordToken.where(:user_id => user_id,
                                     :key => params[:key]).last

    if token.nil? || token.expired === true
      # TODO: Redirect to 'expired key' page.
      not_found
    else
      token.expired = true
      if token.save
        session[:user_id] = user_id

        redirect_to user_path user_id
      else
        # TODO: What to do?
        not_found
      end
    end
  end
end
