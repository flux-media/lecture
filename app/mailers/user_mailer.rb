class UserMailer < ApplicationMailer
  default from: 'somewhere@overtherainbow.com'

  def reset_password(user)
    @user = user
    @url = 'http://somewhere.com'
    mail(to: @user.email, subject: 'Let me reset your password')
  end
end
