require 'mailgun'

class InquiriesController < ApplicationController
  def create
    name = params[:name].nil? ? '' : params[:name].squish
    email = params[:email].nil? ? '' : params[:email].squish
    content = params[:content].nil? ? '' : params[:content]
    result = Hash.new
    result['result'] = 1
    result['data'] = Hash.new

    if name.length > 0 && email.length > 0 && content.length > 0
      mg_client = Mailgun::Client.new(Rails.application.secrets.mailgun_key)

      message_params = {:from => email,
                        # TODO: Update this.
                        :to => 'master@sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org',
                        :subject => 'Inquiries from ' + name.to_s,
                        :text => content}

      mg_client.send_message('sandboxdd06a1ef54af47498077a84b91a0f0a0.mailgun.org', message_params)

      result['result'] = 0
      result['data']['title'] = t('success')
      result['data']['text'] = t('inquiry_submit_success')
      result['data']['type'] = 'success'
      result['data']['confirmButtonText'] = t('confirm')
    else
      result['data']['title'] = t('error')
      result['data']['text'] = t('server_error')
      result['data']['type'] = 'error'
      result['data']['confirmButtonText'] = t('confirm')
    end

    render json: result
  end

  def new

  end
end
