class SessionsController < ApplicationController
  def new
    @is_banner_visible = true
    @target = params[:target]
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      if request.referer.to_s.include? 'admin'
        redirect_to admin_path
      else
        redirect_to root_url + params[:target]
      end
    else
      # If user's login doesn't work, send them back to the login form.
      if request.referer.to_s.include? 'admin'
        redirect_to admin_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    if request.referer.to_s.include? 'admin'
      redirect_to admin_path
    else
      redirect_to login_path
    end
  end
end
