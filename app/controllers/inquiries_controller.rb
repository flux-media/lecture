require 'mailgun'

class InquiriesController < ApplicationController
  def create
    email = params[:email]
    name = params[:name]
    content = params[:content]

    if !email.nil? && !name.nil? && !content.nil?
      mg_client = Mailgun::Client.new(Rails.application.secrets.mailgun_key)

      message_params = {:from => email,
                        # TODO: Update this.
                        :to => 'master@sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org',
                        :subject => 'Inquiries from ' + name.to_s,
                        :text => content}

      mg_client.send_message('sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org', message_params)
    end

    redirect_to new_inquiry_path
  end

  def new

  end
end
