class SessionsController < ApplicationController
  def new
    render :locals => {target: params[:target]}
  end

  def create
    user = User.find_by_email(params[:user][:email])
    password = params[:user][:password]
    # If the user exists AND the password entered is correct.
    if user && password.to_s.length > 0 && user.authenticate(password)
      # Save the user id inside the browser cookie.
      # This is how we keep the user logged in
      # when they navigate around our website.
      session[:user_id] = user.id

      # For a nicer look of URL, strip off a leading '/'.
      target = params[:target]
      if target.start_with?('/')
        target = target[1..-1]
      end
      redirect_to root_url + target
    else
      # If user's login doesn't work,
      # send them back to the login form.
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def new_by_provider
    provider = params[:provider]
    token = params[:token]

    result = Hash.new
    email = 'default_email'
    name = 'default_name'

    if provider === 'facebook'
      url = URI.parse('https://graph.facebook.com/v2.4/me?fields=id,name,email&access_token=' + URI.encode(token))
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Get.new(url.to_s)
      res = JSON(http.request(req).body)

      unless res.has_key?('error')
        email = res['email']
        id = res['id']
        name = res['name']
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
    result['redirect_url'] = root_url + target

    render json: result
  end

  def new_from_token
    user_id = params[:user_id]
    token = ResetPasswordToken.where(:user_id => user_id, :key => params[:key]).last

    if token.nil? || token.expired === true
      # TODO: Redirect to 'expired key' page.
      not_found
    else
      token.expired = true
      if token.save
        session[:user_id] = user_id

        redirect_to user_path user_id
      end
    end
  end
end
