class AddDiscountToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :discount_code, :string
    add_column :orders, :discount_percentage, :integer
    add_column :orders, :discount_amount, :decimal, precision: 10, scale: 2, default: 0.0, null: false
    add_column :orders, :discounted_subtotal, :decimal, precision: 10, scale: 2, default: 0.0, null: false
  end
end
