class PaymentsController < ApplicationController
  def create
    result = Hash.new
    result['result'] = 1
    result['data'] = Hash.new

    if current_user.nil?
      result['data']['title'] = t('error')
      result['data']['text'] = t('not_authorized')
      result['data']['type'] = 'error'
      result['data']['confirmButtonText'] = t('confirm')
      result['data']['redirect_url'] = login_path(:target => new_payment_path)
    else
      pricing = Pricing.find(params[:pricing_id])

      if pricing.nil?
        result['data']['title'] = t('error')
        result['data']['text'] = t('wrong_parameters')
        result['data']['type'] = 'error'
        result['data']['confirmButtonText'] = t('confirm')
      else
        payment = Payment.new
        payment.payment_state = PaymentState.find_by_key('pending')
        payment.user = current_user
        payment.point = pricing.point
        payment.amount = pricing.discount_price

        if payment.save
          result['data']['title'] = t('success')
          result['data']['text'] = t('payment_request_success')
          result['data']['type'] = 'success'
          result['data']['confirmButtonText'] = t('confirm')
          result['data']['redirect_url'] = user_path current_user.id
        else
          result['data']['title'] = t('error')
          result['data']['text'] = t('database_error')
          result['data']['type'] = 'error'
          result['data']['confirmButtonText'] = t('confirm')
        end
      end
    end

    render json: result,
           status: result['result'] === 0 ? 200 : 500
  end

  def new
    render locals: {pricings: Pricing.all}
  end
end
