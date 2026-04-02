class DiscountCodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @discount_codes = DiscountCode.where(active: true).where("expires_at IS NULL OR expires_at > ?", Time.zone.now)
  end

  def create
    @discount_code = DiscountCode.find_by("lower(code) = ?", params[:code].to_s.downcase)

    if @discount_code && @discount_code.active? && (@discount_code.expires_at.nil? || @discount_code.expires_at > Time.zone.now)
      session[:discount_code_id] = @discount_code.id
      flash[:notice] = "Discount code applied: #{@discount_code.code} (#{@discount_code.discount_percentage}% off)"
    else
      session.delete(:discount_code_id)
      flash[:alert] = "Invalid or expired discount code."
    end

    redirect_to cart_path
  end
end
