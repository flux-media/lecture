class Admin::PaymentsController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def destroy
    payment = Payment.find(params[:id])

    if payment.nil?
      # Wrong payment!
      return
    else
      if payment.destroy
        redirect_to admin_payments_path
      end
    end
  end

  def index
    @payments = Payment.all
    render :locals => {
               payment_states: PaymentState.all}
  end

  def update
    payment = Payment.find(params[:id])

    if payment.nil?
      # Wrong payment!
      return
    else
      payment.point = params[:point]
      payment.amount = params[:amount]
      payment.payment_state = PaymentState.find_by_key(params[:payment_state])

      if payment.save
        payment.touch
        redirect_to admin_payments_path
      end
    end
  end
end
