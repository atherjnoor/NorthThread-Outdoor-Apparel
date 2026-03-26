class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy

  validates :status, presence: true, inclusion: { in: %w[new paid shipped] }
  validates :subtotal, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :grand_total, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def total_tax
    [gst_amount || 0, pst_amount || 0, hst_amount || 0].sum
  end
end
