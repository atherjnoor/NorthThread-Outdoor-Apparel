class Product < ApplicationRecord
  has_and_belongs_to_many :categories, join_table: :product_categories
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :sale_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate :sale_price_required_when_on_sale

  def sale_price_required_when_on_sale
    if on_sale && sale_price.nil?
      errors.add(:sale_price, "must be present when product is on sale")
    end
  end

  def display_price
    on_sale ? sale_price : price
  end

  has_many :product_reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  def related_products(limit = 4)
    Product
      .joins(:categories)
      .where(categories: { id: categories.pluck(:id) })
      .where.not(id: id)
      .distinct
      .limit(limit)
  end

  def average_rating
    ratings = product_reviews.pluck(:rating).compact
    return nil if ratings.empty?
    (ratings.sum.to_f / ratings.size).round(2)
  end

  def reviews_count
    product_reviews.count
  end
end
