class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: true

  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates :unit_price_snapshot, numericality: { greater_than_or_equal_to: 0 }
  validates :line_total, numericality: { greater_than_or_equal_to: 0 }
end
