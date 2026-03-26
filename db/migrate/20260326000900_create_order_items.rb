class CreateOrderItems < ActiveRecord::Migration[8.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, foreign_key: true

      t.string :product_name_snapshot, null: false
      t.decimal :unit_price_snapshot, precision: 10, scale: 2, null: false
      t.integer :quantity, null: false
      t.decimal :line_total, precision: 10, scale: 2, null: false
    end

    add_index :order_items, [:order_id, :product_id]
  end
end
