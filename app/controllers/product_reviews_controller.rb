class ProductReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def create
    @review = @product.product_reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: "Thank you for your review!"
    else
      flash[:alert] = @review.errors.full_messages.to_sentence
      redirect_to product_path(@product)
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:product_review).permit(:rating, :comment)
  end
end
