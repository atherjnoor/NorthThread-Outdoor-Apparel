require "ostruct"

class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :load_cart

  def show
    @provinces = Province.all.order(:name)
    if @cart.empty?
      redirect_to products_path, alert: "Your cart is empty."
      return
    end

    @items = Product.where(id: @cart.keys).includes(:categories)
    @cart_items = @items.map do |product|
      quantity = @cart[product.id.to_s].to_i
      OpenStruct.new(product: product, quantity: quantity)
    end

    @subtotal = @cart_items.sum { |item| item.product.display_price * item.quantity }

    @discount_code = fetch_active_discount_code
    @discount_amount = calculate_discount_amount(@subtotal, @discount_code)
    @discounted_subtotal = (@subtotal - @discount_amount).round(2)

    @user_addresses = current_user.addresses
    @default_address = @user_addresses.find_by(is_default: true) || @user_addresses.first
  end

  def create
    if @cart.empty?
      redirect_to products_path, alert: "Your cart is empty."
      return
    end

    province = Province.find(checkout_params[:province_id])
    address = create_or_use_address(province)

    unless address.save
      redirect_back(fallback_location: checkout_path, alert: address.errors.full_messages.join(", "))
      return
    end

    items = Product.where(id: @cart.keys).includes(:categories)
    cart_items = items.map do |product|
      quantity = @cart[product.id.to_s].to_i
      OpenStruct.new(product: product, quantity: quantity)
    end

    subtotal = cart_items.sum { |item| item.product.display_price * item.quantity }
    discount_code = fetch_active_discount_code
    discount_amount = calculate_discount_amount(subtotal, discount_code)
    discounted_subtotal = (subtotal - discount_amount).round(2)

    gst = (discounted_subtotal * province.gst_rate).round(2)
    pst = (discounted_subtotal * province.pst_rate).round(2)
    hst = (discounted_subtotal * province.hst_rate).round(2)
    grand_total = discounted_subtotal + gst + pst + hst

    order = Order.new(
      user_id: current_user.id,
      address_id: address.id,
      status: "new",
      province_snapshot: province.name,
      gst_rate_snapshot: province.gst_rate,
      pst_rate_snapshot: province.pst_rate,
      hst_rate_snapshot: province.hst_rate,
      subtotal: subtotal,
      discount_code: discount_code&.code,
      discount_percentage: discount_code&.discount_percentage,
      discount_amount: discount_amount,
      discounted_subtotal: discounted_subtotal,
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

      # Send confirmation email
      OrderMailer.order_confirmation(order).deliver_later

      session[:cart] = {}
      session.delete(:discount_code_id)
      redirect_to order_path(order), notice: "Order created successfully!"
    else
      redirect_back(fallback_location: checkout_path, alert: order.errors.full_messages.join(", "))
    end
  end

  private

  def load_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def checkout_params
    params.require(:order).permit(:province_id, address_attributes: [ :address_line1, :address_line2, :city, :postal_code, :is_default ])
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

  def fetch_active_discount_code
    return nil unless session[:discount_code_id]

    discount_code = DiscountCode.find_by(id: session[:discount_code_id])
    return nil unless discount_code&.active?
    return nil if discount_code.expires_at.present? && discount_code.expires_at <= Time.zone.now

    discount_code
  end

  def calculate_discount_amount(subtotal, discount_code)
    return 0.0 unless discount_code

    amount = (subtotal * discount_code.discount_percentage.to_f / 100.0).round(2)
    [ amount, subtotal ].min
  end
end
