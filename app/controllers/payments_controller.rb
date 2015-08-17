class PaymentsController < ApplicationController
  def create
    point = params[:point]

    if point.nil?
      # Wrong point
      return
    elsif current_user.nil?
      redirect_to login_path(:target => payments_path(point: point))
    else
      payment = Payment.new
      payment.payment_state = PaymentState.find_by_key('pending')
      payment.user = current_user
      payment.point = point
      # TODO: Update later.
      payment.amount = Integer(point) * 10000

      if payment.save
        redirect_to user_path current_user.id
      end
    end
  end

  def new

  end
end
