require "ostruct"

class CartsController < ApplicationController
  before_action :load_cart

  def show
    @items = Product.where(id: @cart.keys)
    @cart_items = @items.map do |product|
      quantity = @cart[product.id.to_s].to_i
      line_total = product.display_price * quantity
      OpenStruct.new(product: product, quantity: quantity, line_total: line_total)
    end
    @subtotal = @cart_items.sum(&:line_total)
  end

  def create
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if quantity < 1
      flash[:alert] = I18n.t("cart.errors.invalid_quantity", default: "Please select a valid quantity.")
      return redirect_back(fallback_location: products_path)
    end

    @cart[product_id] = (@cart[product_id] || 0) + quantity
    session[:cart] = @cart

    flash[:notice] = I18n.t("cart.notices.added", default: "Product added to your cart.")
    redirect_to cart_path
  end

  def update
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if quantity < 1
      @cart.delete(product_id)
      flash[:notice] = I18n.t("cart.notices.removed", default: "Product removed from your cart.")
    else
      @cart[product_id] = quantity
      flash[:notice] = I18n.t("cart.notices.updated", default: "Quantity updated.")
    end

    session[:cart] = @cart
    redirect_to cart_path
  end

  def destroy
    product_id = params[:product_id].to_s
    @cart.delete(product_id)
    session[:cart] = @cart
    flash[:notice] = I18n.t("cart.notices.removed", default: "Product removed from your cart.")
    redirect_to cart_path
  end

  private

  def load_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end
end
