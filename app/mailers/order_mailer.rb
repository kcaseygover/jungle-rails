class OrderMailer < ApplicationMailer
default from: 'no-reply@jungle.com'

  def receipt_email(user)
    @user = user

    @url  = 'http://localhost:3000/login'
    mail(to: @user,
      subject: 'Order Confirmation: #   ',

      )
  end
end
