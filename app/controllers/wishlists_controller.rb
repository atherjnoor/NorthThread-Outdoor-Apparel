class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlists = current_user.wishlists.includes(product: [ images_attachments: :blob ])
  end

  def create
    product = Product.find(params[:product_id])
    @wishlist = current_user.wishlists.build(product: product)

    if @wishlist.save
      redirect_to wishlists_path, notice: "Product added to wishlist."
    else
      redirect_back(fallback_location: products_path, alert: @wishlist.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @wishlist = current_user.wishlists.find(params[:id])
    @wishlist.destroy
    redirect_to wishlists_path, notice: "Product removed from wishlist."
  end
end
