class ProductsController < ApplicationController
  before_action :set_product, only: [ :show ]

  def index
    @categories = Category.all
    @products = Product.all.order(created_at: :desc)

    if params[:keyword].present?
      keyword = "%#{params[:keyword].strip}%"
      @products = @products.where("name ILIKE :keyword OR description ILIKE :keyword", keyword: keyword)
    end

    if params[:category_id].present?
      @products = @products.joins(:categories).where(categories: { id: params[:category_id] })
    end

    # Apply filters
    if params[:filter] == "on_sale"
      @products = @products.where(on_sale: true)
    elsif params[:filter] == "new"
      @products = @products.where("products.created_at >= ?", 7.days.ago)
    elsif params[:filter] == "recently_updated"
      @products = @products.where("products.updated_at >= ?", 7.days.ago)
    end

    @products = @products.page(params[:page]).per(12)
  end

  def show
  end

  private

  def set_product
    @product = Product.includes(:categories, images_attachments: :blob).find(params[:id])
  end
end
