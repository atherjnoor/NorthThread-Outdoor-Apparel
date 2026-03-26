class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all.order(:name)
  end

  def show
    @categories = Category.all
    @products = @category.products.order(created_at: :desc).page(params[:page]).per(12)
    render 'products/index'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
