class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order

  def new
    @stripe_public_key = Rails.application.credentials.dig(:stripe, :publishable_key) || "pk_test_demo"
  end

  def create
    begin
      # Stripe Sandbox mode - using test token
      stripe_token = params[:stripeToken] || "tok_visa"  # Test visa token

      # In production, you'd use: Stripe::Charge.create(...)
      # For sandbox demo, we simulate successful payment
      payment_intent = {
        id: "pi_#{SecureRandom.hex(12)}",  # Mock Stripe payment id
        status: "succeeded",
        amount: (@order.grand_total * 100).to_i,  # Stripe uses cents
        currency: "cad"
      }

      # Update order with payment details
      @order.update!(
        status: "paid",
        stripe_payment_id: payment_intent[:id]
      )

      redirect_to order_path(@order), notice: "Payment successful! Your order has been confirmed."
    rescue StandardError => e
      redirect_to new_order_payment_path(@order), alert: "Payment failed: #{e.message}"
    end
  end

  private

  def load_order
    @order = Order.find(params[:order_id])
    authorize_order!
  end

  def authorize_order!
    redirect_to products_path, alert: "Not authorized" unless @order.user_id == current_user.id
  end
end
