class OrderMailer < ApplicationMailer
default from: 'no-reply@jungle.com'

  def receipt_email(email)
    @user = email
    @line_item = line_item
    @url  = 'http://localhost:3000'
    mail(to: @user,
      subject: 'Order Confirmation: #{@line_item.order_id}',
      template_path: 'notifications',
      template_name: 'another')
  end
end
