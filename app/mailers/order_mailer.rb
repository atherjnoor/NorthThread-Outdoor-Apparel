class OrderMailer < ApplicationMailer
  default from: "orders@norththread.ca"

  def order_confirmation(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Order Confirmation ##{@order.id}")
  end

  def order_shipped(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Your Order ##{@order.id} Has Shipped")
  end
end
