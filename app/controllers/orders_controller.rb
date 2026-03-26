class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
    authorize_order!
  end

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  private

  def authorize_order!
    redirect_to products_path, alert: 'Not authorized' unless @order.user_id == current_user.id || current_admin_user.present?
  end
end
