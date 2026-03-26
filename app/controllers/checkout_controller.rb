class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :load_cart

  def show
    @provinces = Province.all.order(:name)
    if @cart.empty?
      redirect_to products_path, alert: 'Your cart is empty.'
      return
    end

    @items = Product.where(id: @cart.keys).includes(:categories)
    @cart_items = @items.map do |product|
      quantity = @cart[product.id.to_s].to_i
      OpenStruct.new(product: product, quantity: quantity)
    end

    @subtotal = @cart_items.sum { |item| item.product.display_price * item.quantity }
    @user_addresses = current_user.addresses
    @default_address = @user_addresses.find_by(is_default: true) || @user_addresses.first
  end

  def create
    if @cart.empty?
      redirect_to products_path, alert: 'Your cart is empty.'
      return
    end

    province = Province.find(checkout_params[:province_id])
    address = create_or_use_address(province)

    unless address.save
      redirect_back(fallback_location: checkout_path, alert: address.errors.full_messages.join(', '))
      return
    end

    items = Product.where(id: @cart.keys).includes(:categories)
    cart_items = items.map do |product|
      quantity = @cart[product.id.to_s].to_i
      OpenStruct.new(product: product, quantity: quantity)
    end

    subtotal = cart_items.sum { |item| item.product.display_price * item.quantity }
    gst = (subtotal * province.gst_rate).round(2)
    pst = (subtotal * province.pst_rate).round(2)
    hst = (subtotal * province.hst_rate).round(2)
    grand_total = subtotal + gst + pst + hst

    order = Order.new(
      user_id: current_user.id,
      address_id: address.id,
      status: 'new',
      province_snapshot: province.name,
      gst_rate_snapshot: province.gst_rate,
      pst_rate_snapshot: province.pst_rate,
      hst_rate_snapshot: province.hst_rate,
      subtotal: subtotal,
      gst_amount: gst,
      pst_amount: pst,
      hst_amount: hst,
      grand_total: grand_total
    )

    if order.save
      cart_items.each do |item|
        OrderItem.create(
          order_id: order.id,
          product_id: item.product.id,
          product_name_snapshot: item.product.name,
          unit_price_snapshot: item.product.display_price,
          quantity: item.quantity,
          line_total: item.product.display_price * item.quantity
        )
      end

      session[:cart] = {}
      redirect_to order_path(order), notice: 'Order created successfully!'
    else
      redirect_back(fallback_location: checkout_path, alert: order.errors.full_messages.join(', '))
    end
  end

  private

  def load_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def checkout_params
    params.require(:order).permit(:province_id, address_attributes: [:address_line1, :address_line2, :city, :postal_code, :is_default])
  end

  def create_or_use_address(province)
    if checkout_params[:address_attributes].present?
      current_user.addresses.build(
        checkout_params[:address_attributes].merge(province_id: province.id)
      )
    else
      Address.find(checkout_params[:province_id]) || current_user.addresses.first
    end
  end
end
