class Category < ApplicationRecord
  has_and_belongs_to_many :products, join_table: :product_categories

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :description, allow_blank: true, length: { maximum: 500 }

  scope :with_products, -> { joins(:products).distinct }
  scope :without_products, -> { left_outer_joins(:products).where(products: { id: nil }) }

  def product_count
    products.count
  end
end
