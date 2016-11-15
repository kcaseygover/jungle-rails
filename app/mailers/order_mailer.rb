class OrderMailer < ApplicationMailer
default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order = order

    @url  = 'http://localhost:3000/login'
    mail(to: @order,
      subject: 'Jungle Order Confirmation: ##{@order.id} ',

      )
  end
end
